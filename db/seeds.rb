require 'httparty'
require 'json'

# Clear existing data
# Destroy join tables
# AnimalPlant.destroy_all
# PropagationPlant.destroy_all
# SunlightPlant.destroy_all

# # Destroy main table
# Plant.destroy_all

# # Destroy related parent tables
# Animal.destroy_all
# Propagation.destroy_all
# Sunlight.destroy_all
# Origin.destroy_all
# Type.destroy_all
# Watering.destroy_all
# GrowthRate.destroy_all
# Care.destroy_all

def fetch_and_seed_plant(id)
  # url = "https://perenual.com/api/species-list?key=#{ENV['PERENUAL_API_KEY']}&page=#{page}"
  url = "https://perenual.com/api/species/details/#{id}?key=#{ENV['PERENUAL_API_KEY']}"
  response = HTTParty.get(url)

  if response.code == 200
    plant_data = JSON.parse(response.body)

    # Find or create associated records (e.g., Origin, Type, Watering)
    origin = Origin.find_or_create_by!(name: plant_data['origin'] || 'Unknown')
    type = Type.find_or_create_by!(name: plant_data['type'] || 'Unknown')
    watering = Watering.find_or_create_by!(level: plant_data['watering'] || 'Moderate')
    growth_rate = GrowthRate.find_or_create_by!(level: plant_data['growth_rate'] || 'Medium')
    care = Care.find_or_create_by!(level: plant_data['care_level'] || 'Medium')

    # Create the plant record
    plant = Plant.create!(
      common_name: plant_data['common_name'],
      scientific_name: plant_data['scientific_name']&.first,
      other_names: plant_data['other_name']&.join(', '),
      description: plant_data['description'],
      image_url: plant_data['default_image']&.dig('original_url') || "",
      origin: origin,
      type: type,
      watering: watering,
      growth_rate: growth_rate,
      care: care,
      thorny: plant_data['thorny'],
      invasive: plant_data['invasive'],
      tropical: plant_data['tropical'],
      indoor: plant_data['indoor'],
      flower: plant_data['flowers'],
      cones: plant_data['cones'],
      fruits: plant_data['fruits'],
      edible_fruit: plant_data['edible_fruit'],
      medicinal: plant_data['medicinal'],
      poisonous_to_humans: plant_data['poisonous_to_humans'],
      poisonous_to_pets: plant_data['poisonous_to_pets']
    )

    # Associate Animals
    plant_data['attracts']&.each do |animal_name|
      animal = Animal.find_or_create_by!(name: animal_name)
      plant.animals << animal unless plant.animals.include?(animal)
    end

    # Associate Propagation methods
    plant_data['propagation']&.each do |propagation_method|
      propagation = Propagation.find_or_create_by!(name: propagation_method)
      plant.propagations << propagation unless plant.propagations.include?(propagation)
    end

    # Associate Sunlight conditions
    plant_data['sunlight']&.each do |sunlight_type|
      sunlight = Sunlight.find_or_create_by!(name: sunlight_type)
      plant.sunlights << sunlight unless plant.sunlights.include?(sunlight)
    end

    puts "Seeded #{plant.common_name} (ID: #{plant.id})"

  else
    # Handle API errors
    puts "Error fetching data from API: #{response.code} - #{response.message}"
  end
end

# Done:
# randoms = [ 80, 1464, 2018, 828, 2628, 313, 1129, 2176, 773, 871, 1420, 1764,
# 1536, 214, 1292, 767, 2856, 1230, 510, 623, 2494, 113, 961, 2871, 238, 2591, 2750, 810, 1961, 1401, 2536, 1836,
# 1518, 1903, 638, 1214, 924, 1432, 1887, 2372, 554, 185, 2426, 1001, 290, 1994, 927, 243, 2378, 1797, 2962, 2923,
# 732, 69, 2119, 2678, 1932, 518, 1705, 995, 156, 1188, 855, 604, 2258, 1937, 1513, 2586, 2492, 2749, 562, 688,
# 2774, 734, 1977, 66, 1340, 1530, 14, 2010, 1781, 1296, 2999, 105, 752, 1909, 284, 481, 2332, 818, 2540, 555]

# randoms = [864, 2158, 2320, 158, 350, 1186, 82, 2650, 1107, 1011, 1124,
# 1678, 88, 1183, 2164, 1692, 154, 1435, 1693, 1281, 2573, 1910, 2844,
# 694, 2045, 1999, 1889, 1852, 448, 1815, 1027, 2545, 1679, 1291, 534, 153, 1061,
# 498, 2882, 33, 2452, 2236, 972, 1278, 838, 804, 1386, 2823]

# randoms = [578, 1960, 748, 2275, 956, 2697, 2963, 1669, 1293, 1300, 1709, 1890, 2146,
# 543, 1052, 740, 2388, 2790, 1630, 921, 827, 371, 2771, 1783, 2433, 525, 842, 2300,
# 1543, 794, 263, 1006, 892, 533, 1100, 1769, 203, 2842, 2955, 860, 52, 2207, 1978,
# 1148, 2665, 2001, 1750, 1555, 779, 981, 2666, 1564]

randoms = [2607, 2171, 672, 2302, 304, 1427, 464, 2837, 1738, 2308, 1652, 57, 2447,
2242, 466, 2023, 1580, 1943, 1014, 40, 1633, 1324, 2374, 1572, 2884, 1115, 2024,
2210, 930, 667, 2626, 352, 986, 2192, 140, 1509, 2887, 1458, 1069, 1544, 1539,
2891, 2906, 1515, 1112, 2681, 2370, 1954, 433, 2405, 1905, 2512, 757, 1118, 889,
1136, 2711, 1857, 1437, 196, 1773, 1979, 343, 2752, 1083, 678, 2230, 2197, 109, 11,
 2245, 558, 2329, 2166, 287, 170, 2796, 1644, 1320, 1864, 984, 1728, 735, 1235, 745,
 2479, 2570, 1763, 516, 1016, 782, 222, 2716, 1777, 1984, 303, 560, 1219, 1822, 1080]

randoms.each do |id|
   fetch_and_seed_plant(id)
end