class Plant {
  final int plantId;
  final int price;
  final String size;
  final double rating;
  final int humidity;
  final String temperature;
  final String category;
  final String plantName;
  final String imageURL;
  final List<String> plantImages;
  bool isFavorated;
  final String decription;
  final String care;

  bool isSelected;

  Plant({
    required this.plantId,
    required this.price,
    required this.category,
    required this.plantName,
    required this.size,
    required this.rating,
    required this.humidity,
    required this.temperature,
    required this.imageURL,
    required this.isFavorated,
    required this.decription,
    required this.care,
    required this.isSelected,
    required this.plantImages,
  });

  //List of Plants data
  static List<Plant> plantList = [
    Plant(
      plantId: 0,
      price: 340,
      category: 'Indoor',
      plantName: 'Zanzibar Gem',
      size: 'Small',
      rating: 4.2,
      humidity: 46,
      temperature: '23 - 26',
      imageURL: 'assets/images/plant-six.png',
      isFavorated: false,
      decription:
          'Zanzibar Gem is a hardy hero with high-gloss foliage and fleshy stems. '
          'Green your office desk or bring some natural vivacity to your living room with this undemanding pot-friendly plant.',
      isSelected: false,
      care: 'Light:'
          '\n      The Zanzibar Gem is a hardy houseplant, which thrives quite well on neglect. '
          'It can be placed in areas with very little light, but its ideal situation is medium to bright indirect light. '
          'Avoid direct light as it will burn the plant.'
          '\n\nWater:'
          '\n      These plants are highly drought-tolerant and can handle infrequent watering thanks to their thick rhizomes. '
          'You should generally water zz plants once the soil dries out completely—usually once every two weeks, depending '
          'on their growing conditions. It\'s better to water your plant less than give it too much water. When watering, '
          'wet the soil thoroughly until the water is running out of the drainage hole at the bottom of the pot. Get rid '
          'of the excess water.'
          '\n\nSoil:'
          '\n      ZZ plants are not overly picky about their potting medium as long as it is well-draining. Most standard '
          'potting mixes should be sufficient for your plant. If additional drainage is required, mixing in perlite or sand '
          'will help.'
          '\n\nTemperature & Humidity:'
          '\n      The Zanzibar Gem prefers warm temperatures and high humidity. It can tolerate dry and colder areas also, '
          'Keep your Zanzibar Gem away from drafts of hot and cold air that can harm it.'
          '\n\nFertilizer:'
          '\n      ZZ plants generally do not require regular fertilizing to thrive. However, if you\'re hoping '
          'to increase your plant\'s size or vigor, fertilize your zz plant with indoor plant fertilizer diluted to '
          'half-strength one to two times during its active growing season.'
          '\n\nMaintenance:'
          '\n      Like any semi-permanent fixture in your house, plants need occasional dusting. '
          'To keep your Zanzibar Gem looking green and shiny, give its leaves some love; '
          'an occasional wipe with a cloth and lukewarm water. Prune any discoloured or yellowing leaves.'
          '\n      You can feed your Zanzibar Gem once or twice in the warmer months with a '
          'liquid fertiliser diluted to half the recommended strength.',
      plantImages: [
        "assets/images/zz3.jpg",
        "assets/images/zz.jpg",
        "assets/images/zz2.jpeg",
        "assets/images/zz1.jpg",
      ],
    ),

    Plant(
      plantId: 1,
      price: 470,
      category: 'Indoor',
      plantName: 'Baby Rubber',
      size: 'Medium',
      rating: 4.7,
      humidity: 46,
      temperature: '21 - 25',
      imageURL: 'assets/images/plant-eight.png',
      isFavorated: false,
      decription:
          'If you are looking for an indoor plant that makes a bold statement, '
          'then look no further than a Rubber Plant (Ficus elastica). '
          'Besides being an attractive low maintenance plant, it also purifies the indoor air.',
      isSelected: false,
      care: 'Sunlight:'
          '\n      Place the plant on a bright and well-lit spot that receives indirect or morning sunlight. '
          'Avoid direct sunlight, especially in the afternoon sun. Otherwise, the leaves will eventually fall off.'
          '\n\nWater:'
          '\n      Apply moderately, whenever the top one-inch of soil feels dry. '
          'Provide sufficient drainage to plant and avoid excess watering as it may cause root rot.'
          '\n\nSoil:'
          '\n      Use well-drained quality potting mix and a container with proper drainage.'
          '\n\nTemperature and Humidity:'
          '\n      Rubber plant prefers moderately cool, moist and humid air. For humidity, '
          'you can use a humidifier or set it on a tray with pebbles and water.'
          '\n\nFertilizer:'
          '\n      Feed the plant a weak liquid fertilizer throughout the growing season. They are relatively'
          ' heavy feeders when healthy. Some experts recommend only lightly fertilizing indoor plants to '
          'prevent stretching and plants becoming root-bound because they grow too fast.'
          '\n\n⨠ Wipe and clean the leaves with a damp sponge once in a week.'
          '\n⨠ Avoid over-watering or misting of leaves with very cold water as rubber plant loses its leaves due to over '
          'watering or when sprayed with cold water.',
      plantImages: [
        "assets/images/br1.jpg",
        "assets/images/br2.jpg",
        "assets/images/br3.jpg",
        "assets/images/br4.jpg",
      ],
    ),
    Plant(
        plantId: 2,
        price: 940,
        category: 'Indoor',
        plantName: 'Dieffenbachia',
        size: 'Large',
        rating: 4.7,
        humidity: 34,
        temperature: '22 - 25',
        imageURL: 'assets/images/plant-three.png',
        isFavorated: false,
        plantImages: [
          "assets/images/df4.jpg",
          "assets/images/df2.jpg",
          "assets/images/df1.jpg",
          "assets/images/df3.jpg",
        ],
        decription:
            'Dieffenbachia is an easy houseplant to grow and adds a lush, tropical look to the room. '
            'This plant’s common name is “dumbcane,” and for good reason: The sap of the plant can cause '
            'numbness when touched and interfere with the ability to speak if it gets near your mouth, '
            'causing you to temporarily become mute, or “dumb.” Be sure to wear gloves when handling the plant, '
            'and keep it away from children and pets.',
        care: 'Planting:'
            '\n      If you live in a warm climate, plant dieffenbachia outdoors in your shade garden where it can enjoy a '
            'little dappled light. Plant outdoors in the early spring and water twice a week until the end of summer and early fall. '
            'If you are planting more than one dieffenbachia in a garden, give them plenty of space '
            '(a few feet between each) as the plant can grow tall and a few feet wide. When planting indoors, '
            'consider placing the dieffenbachia plant in a naturally humid area, like a bathroom or kitchen, where it will thrive. '
            'If you place the plant in a dry area of your home, consider misting it or putting it on a rock tray filled with water that '
            'will naturally evaporate and create humidity around the plant.'
            '\n\nWater:'
            '\n     During the growing season, dieffenbachias like regular moisture and do not want to dry out. '
            'A large dieffenbachia might need to be watered twice a week. In the winter, you can cut back on the water. '
            'At the same time, it\'s important not to overwater a dieffenbachia, which can cause rot problems. '
            'Make sure the top of the soil is fully dried out before watering.'
            '\n\nSoil:'
            '\n      Use a fast-draining, well-aerated potting mix. '
            'Make sure drainage is good to avoid damaging the roots; they should never be left in soggy soil.'
            '\n\nTemperature and Humidity:'
            '\n      This plant likes fairly warm conditions, from 65 degrees to 75 degrees Fahrenheit. '
            'If the temperature drops below 60 degrees or if the plant is exposed to cold drafts, '
            'it is likely to lose lower leaves and assume a palm-like appearance. The plant appreciates high humidity.'
            '\n\nPests:'
            '\n      Dieffenbachia plants are largely trouble-free, but like many indoor plants, '
            'they can be susceptible to spider mites, especially indoor plants that are placed in dry air. '
            'These pests can be treated with a horticultural oil along with added humidity.'
            '\n\nPruning:'
            '\n      A dieffenbachia plant usually requires pruning when it\'s too tall and there '
            'seem to be few leaves on the lower part of the stem. With a sterilized, sharp cutting tool, '
            'prune the plant down to size from the top to trigger new growth.',
        isSelected: false),

    Plant(
        plantId: 3,
        price: 699,
        category: 'Garden',
        plantName: 'FiddleLeaf fig',
        size: 'Large',
        rating: 4.1,
        humidity: 66,
        plantImages: [
          "assets/images/ff1.jpeg",
          "assets/images/ff2.jpg",
          "assets/images/ff3.jpg",
          "assets/images/ff4.jpg",
          "assets/images/ff5.jpg",
        ],
        temperature: '12 - 16',
        imageURL: 'assets/images/plant-four.png',
        isFavorated: true,
        decription:
            'The hot houseplant of the moment (or really, of the last few years), the fiddle leaf fig makes a gorgeous, '
            'architectural statement in any room of the house. But while this lush plant, with its shiny, '
            'violin-shaped leaves, is stunning, it can be hard to keep alive. '
            'But never fear — we\'ve got tips to help you keep it alive and thriving in your space.',
        care: 'Water:'
            '\n     The number one way to kill a fiddle leaf fig is to overwater it or not allow for proper drainage. '
            'Water your plant about once a week or every 10 days. As we mentioned earlier, '
            'FLFs are native to a rainforest-like environment, which means they’re used to receiving a huge deluge of water '
            'with dry spells in between. So when you water at home, it’s best to soak the plant’s soil until dripping, '
            'then let it dry out completely between waterings.'
            '\n\nOverwatering:'
            '\n      Do the leaves of your FLF resemble a green and brown dalmatian? Chances are, '
            'you\'ve overwatered. Inadequate drainage or too little time between waterings allows root rot to set in. '
            'When water sits for an extended amount of time, dormant pathogens in the soil flourish, '
            'feeding on the plant’s root system. By allowing the soil to dry out in between waterings, '
            'pathogens starve and your plant lives to see another day.'
            '\n\nHumidity:'
            '\n      FLFs are native to tropical rainforests and thrive in warm, humid environments, like greenhouses. '
            'Don\'t live in a greenhouse? No problem. Most homes sit at about 40% humidity, which is fine, '
            'but if your house is on the dry side, mist your plant about once a week.'
            '\n\nRepot:'
            '\n      When your plant starts to look too big for its pot or the roots are starting to grow out of the drainage holes, '
            'it’s time to repot – usually every one to two years. Choose a pot (with a couple of drainage holes) that’s about '
            'two inches wider than the original pot. Add about two to three inches of stones to the bottom of the new pot. '
            'This allows for drainage and prevents rot while also facilitating necessary humidity. Add well-draining, '
            'moisture-control potting soil to the new pot and push it to the edges, '
            'leaving a crater in the center for the root ball. Remove root ball from the old pot and cut out any brown, '
            'rotten roots. Loosen the root ball gently with your hand and place it in the soil crater. Top with more soil, '
            'leaving an inch between the soil and lip of the container, and water as usual.'
            '\n\nPruning:'
            '\n      There are two reasons to prune: to remove dead leaves and encourage new growth. '
            'When leaves start to brown significantly (due to stress or root rot), it’s best to remove them '
            'so they don’t suck energy from the plant. Wearing gloves, use sharp, clean pruning shears and cut '
            'the stem of the leaf at an angle, about half an inch away from the trunk. While pruning is a necessary '
            'part of plant maintenance, be careful not to remove more than 5-10 leaves at a time to avoid shock. '
            'You can also use this method to remove lower leaves for a tree-like shape.',
        isSelected: false),
    Plant(
        plantId: 4,
        price: 1299,
        category: 'Outdoor',
        plantName: 'Swiss Cheese',
        size: 'Medium',
        rating: 4.4,
        humidity: 36,
        plantImages: [
          "assets/images/sc1.jpg",
          "assets/images/sc2.jpeg",
          "assets/images/sc3.jpg",
          "assets/images/sc4.jpg",
          "assets/images/sc5.jpg",
        ],
        temperature: '15 - 18',
        imageURL: 'assets/images/plant-five.png',
        isFavorated: false,
        decription:
            'The Swiss cheese plant (Monstera adansonii) gets its common name from its large, heart-shaped leaves that '
            'develop holes as the plant ages (in a process called fenestration). This makes the leaves resemble Swiss cheese. '
            'Native to Central and South America, the Swiss cheese plant is a tropical perennial '
            'that\'s typically grown as an indoor plant.',
        care: 'Sunlight:'
            '\n      Because of the Swiss cheese plant\'s tropical origin, Monstera adansonii needs sunlight, '
            'but it\'s best if the light is bright and indirect. It\'s used to thriving under the cover of large trees in the jungle,'
            ' and the foliage can easily burn if it\'s exposed to too much direct sun. If direct sunlight is unavoidable, '
            'limit exposure to just two or three hours of morning sun.'
            '\n\nWater:'
            '\n      These plants like to be consistently moist but not soaked. Before watering your Swiss cheese plant, '
            'stick your finger into the soil about an inch deep. If the soil feels nearly dry to the touch, '
            'it\'s time to water the plant. Irrigate until a little water runs out of the container\'s drainage holes.'
            '\n\nSoil:'
            '\n      Swiss cheese plants grow best in peat-based potting mix, which will help to trap moisture in the soil without '
            'causing it to become waterlogged. For strong growth, aim for a soil pH between 5.5 and 7.'
            '\n\nTemperature and Humidity:'
            '\n      These jungle plants thrive in very high humidity and warm temperatures. '
            'The closer you can mimic the plant\'s natural conditions, the better. Make sure your plant always remains '
            'in a spot that\'s above 40 degrees Fahrenheit, and protect it from drafts. A humidity level above 50 percent '
            'is ideal. A warm, well-lit bathroom is a good spot for this plant. If you need to increase humidity, mist the '
            'plant or use a humidifier in its space.'
            '\n\nFertilizer:'
            '\n      After potting (or repotting) the plant, wait at least four to six months to fertilize it, '
            'as potting mix typically already has slow-release fertilizer in it. After that, fertilize your '
            'Swiss cheese plant monthly, using an all-purpose liquid fertilizer that has been diluted by half.'
            '\n\nPruning:'
            '\n      The Swiss cheese plant is a climber, so it might need to be pruned if it begins to outgrow your space. '
            'Should you need to prune your plant, aim to do so in the spring. Use sterile pruning shears to '
            'cut back stems by no more than 25 percent. Cut just the stem right above a leaf node so it stays in place. '
            'Also, remove any dead or damaged leaves as needed.',
        isSelected: false),
    Plant(
        plantId: 5,
        price: 360,
        category: 'Indoor',
        plantName: 'Elephant Ears',
        size: 'Small',
        rating: 4.5,
        humidity: 34,
        plantImages: [
          "assets/images/ee1.jpg",
          "assets/images/ee2.jpg",
          "assets/images/ee3.jpeg",
          "assets/images/ee4.jpeg",
          "assets/images/ee5.jpg",
        ],
        temperature: '23 - 34',
        imageURL: 'assets/images/plant-one.png',
        isFavorated: true,
        decription:
            'Elephant ears are tropical perennial plants grown for the appeal of their large leaves rather '
            'than their flowers. Elephant ear is the common name for several species in three plant genera—Colocasia,'
            ' Alocasia, and Xanthosoma. The most common one is Colocasia esculenta, also known as taro. '
            'These fast-growing plants will achieve their full size within two months and are generally planted in '
            'the spring after all danger of frost has passed and soil temperatures have warmed to at least 70 degrees Fahrenheit. '
            'You can also plant them later in early summer.',
        care: 'Sunlight:'
            '\n      Elephant ears can be planted in full sun to part shade, but it prefers growing in a part shade or dappled '
            'sun location. '
            'Cultivars with darker leaves need more sun to maintain their color.'
            '\n\nWater:'
            '\n      Keep elephant ear plants consistently moist. They can even survive nicely in 6 inches of standing water, '
            'although it is best to water the plant when the soil is wet and not soggy and never allow the soil to dry out thoroughly. '
            'In some climates—especially if growing in containers—these plants will need water daily or several times per day. '
            'Let the top of the soil be your guide. It should feel moist; if it\'s not, add water until it is.'
            '\n\nSoil:'
            '\n      Elephant ears grow best in a rich, humusy soil that is moist to the point of being wet. '
            'This plant is ideal for boggy areas, marshes, swampland, or around water gardens.'
            '\n\nTemperature and Humidity:'
            '\n      Elephant ears are tropical plants that do best in circumstances that mimic their native habitat.'
            ' They will be evergreen in USDA zone 10 or slightly warmer but will likely die back to the ground in zones '
            '8 to 9, returning in the spring. This plant thrives in humidity, needing moisture constantly. In colder zones, '
            'the plant will die unless the tubers, corms, or root structures are dug up and stored for the winter.'
            '\n\nFertilizer:'
            '\n      Like many large-leaved tropical plants, elephant ears are heavy feeders. '
            'Apply a water-soluble high-nitrogen fertilizer every two to three weeks.'
            '\n\nPruning:'
            '\n      These plants continue to produce new leaves throughout the growing season. As the old leaves die, '
            'remove them to keep the plant looking vibrant. If you\'re in zone 8 and expect frosty conditions,'
            ' winter pruning is necessary to keep your plant alive after the winter season. '
            'Cut back an elephant ear plant two or three days after the first killing frost when the foliage turns brown. '
            'Sterilize sharp pruning shears and don gloves. Snip off the leaves near the base of the plant, '
            'leaving about 2 inches above the ground. Make clean, straight cuts, do not rip or tear.',
        isSelected: false),

    Plant(
        plantId: 6,
        price: 599,
        category: 'Outdoor',
        plantName: 'Snack Plant',
        size: 'Medium',
        rating: 4.5,
        humidity: 34,
        plantImages: [
          "assets/images/sn4.jpg",
          "assets/images/sn1.jpeg",
          "assets/images/sn2.jpeg",
          "assets/images/sn3.jpg",
          "assets/images/sn5.jpg",
        ],
        temperature: '21 - 24',
        imageURL: 'assets/images/plant-seven.png',
        isFavorated: false,
        decription:
            'Dracaena trifasciata, commonly known as the snake plant, is one of the most popular and hardy species of houseplants. '
            'Up until 2017, it was botanically classified as Sansevieria trifasciata, but its commonalities with Dracaena '
            'species were too many to overlook. The plant features stiff, sword-like leaves and can range anywhere from six '
            'inches to eight feet tall. Snake plants can vary in color although many have green-banded leaves and commonly '
            'feature a yellow border. These plants are easy to grow and, in many cases, are nearly indestructible. '
            'They will thrive in very bright light or almost dark corners of the house. Snake plants generally grow slowly in '
            'indoor light, but increasing its exposure to light will boost growth if it receives a few hours of direct sun. '
            'Planting and repotting is best done in the spring.',
        care: 'Sunlight:'
            '\n      Snake plants prefer indirect but steady light with some direct sun. '
            'They can adapt to full sun conditions and will also survive dimly lit situations.'
            '\n\nWater:'
            '\n      Let the soil dry between waterings. During the winter, reduce watering to monthly, '
            'or whenever the soil is dry to the touch. Err on the side of under-watering; too much water can harm the plant.'
            '\n\nSoil:'
            '\n      Snake plants prefer a loose, well-drained potting mix. This plant will do well in sandier soils. '
            'Use a potting media low in peat content. Peat works well in many situations, but it can become tightly '
            'packed and sometimes has problems rehydrating or draining. An all-purpose cactus potting soil is a good choice.'
            '\n\nTemperature and Humidity:'
            '\n      Snake plants prefer warm conditions and will suffer if exposed to temperatures below 50 degrees Fahrenheit. '
            'Set the plant in a place where it will be protected from drafts. A temperature range between 70 and 90 degrees Fahrenheit '
            'is best. Frost will kill this plant.'
            '\n\nFertilizer:'
            '\n      Feed with a mild cactus fertilizer during the growing season or a balanced liquid slow-release 10-10-10 fertilizer or a '
            '20-20-20 fertilizer diluted to half strength. Do not fertilize in the winter.'
            '\n\nPruning:'
            '\n      Using sterile pruning shears, scissors, or a sharp knife, remove leaves at the soil line or '
            'cut off damaged or mature leaves to encourage new growth. The best time to prune is during the growing '
            'season—usually spring or summer. You can prune during the off-season, but because pruning can stress out '
            'a plant, it is best to do it when the plant is in a growing period. To control the height of your snake plant, '
            'remove the tallest leaves. Also, remove any leaves that are marred. Removing leaves spurs new leaf growth.',
        isSelected: false),
    Plant(
        plantId: 7,
        price: 499,
        category: 'Garden',
        plantName: 'Cast Iron',
        size: 'Medium',
        rating: 4.8,
        humidity: 56,
        plantImages: [
          "assets/images/ci1.jpg",
          "assets/images/ci2.jpg",
          "assets/images/ci4.jpg",
          "assets/images/ci5.jpg",
        ],
        temperature: '19 - 22',
        imageURL: 'assets/images/plant-two.png',
        isFavorated: false,
        decription:
            'The cast-iron plant (Aspidistra elatior) has earned its reputation as a hard-to-kill houseplant, '
            'along with being a beautiful outdoor foliage plant within its growing zones. This plant can '
            'survive lots of neglect and growing conditions that will kill many other plants, such as low '
            'light conditions. It has arching, lance-shaped, deep green, glossy leaves that can reach around '
            '2 feet long and 4 inches wide. When grown outdoors, it sometimes produces insignificant cream and '
            'purple flowers near the base of the plant, but the blossoms usually do not appear when the plant is grown indoors. '
            'The cast-iron plant has a fairly slow growth rate, and spring is generally the best time to plant it.',
        care: 'Sunlight:'
            '\n      Keep cast-iron plants away from direct sunlight, which can bleach and burn the leaves. If you\'re '
            'keeping one as a houseplant, a north-facing window is ideal. Set it slightly back from windows that get '
            'strong light to avoid direct sun. When growing cast-iron plants outdoors, place them in a shady area with indirect sunlight.'
            '\n\nWater:'
            '\n      While these plants have some drought tolerance, they like a moderate amount of soil moisture. '
            'Water young cast-iron plants regularly to keep the soil lightly moist but not soggy. Soil that remains '
            'wet for too long can cause root rot. Water established plants deeply, and then let the soil dry out a '
            'few inches down before watering again. A good general rule is to water when you can stick your finger in '
            'the soil and not feel any dampness.'
            '\n\nSoil:'
            '\n      Cast-iron plants tolerate a wide range of soils, as long as they have good drainage. '
            'They prefer organically rich soil with a slightly acidic to neutral soil pH. Outdoors, they can grow in sandy, '
            'loamy, and even clay soils. For container plants, simply use a standard quality potting mix.'
            '\n\nTemperature and Humidity:'
            '\n      Cast-iron plants prefer temperatures between 60 and 75 degrees Fahrenheit. They are not hardy to cold, '
            'and temperatures that drop below 50 degrees Fahrenheit can damage or kill them. So if you\'re growing your plant '
            'in a container outdoors, be sure to take it inside well before the threat of frost. Moreover, cast-iron plants like '
            'a moderate humidity level, but it\'s not a necessity for healthy growth.'
            '\n\nFertilizer:'
            '\n      Feed your cast-iron plant once a month with an all-purpose liquid fertilizer during the spring and summer months, '
            'following label instructions, or use a slow-release fertilizer in the spring. '
            'It\'s not necessary to fertilize during the fall and winter months. Only apply fertilizer after watering the plant to '
            'avoid burning the roots.',
        isSelected: false),
    Plant(
        plantId: 8,
        price: 780,
        category: 'Garden',
        plantName: 'Alocasia Plant',
        size: 'Small',
        rating: 4.5,
        humidity: 34,
        plantImages: [
          "assets/images/al1.jpeg",
          "assets/images/al2.jpeg",
          "assets/images/al3.jpg",
          "assets/images/al4.jpg",
        ],
        temperature: '23 - 34',
        imageURL: 'assets/images/plant_nine.png',
        isFavorated: true,
        decription:
            'Tropical plants in the Alocasia genus feature stunning foliage that can become the centerpiece '
            'of a garden or room. Large rhizomes or tubers produce enormous heart-shaped or arrow-shaped ears, '
            'leading to the popular common name, elephant\'s ear. '
            '\nFast-growing Alocasia plants are most often grown as houseplants, but it\'s common to bring them'
            ' outdoors during the warm months, sometimes burying the entire pot in the ground to create a natural look.',
        care: 'Sunlight:'
            '\n      Light requirements vary from shade to full sunlight, depending on the species and variety. Ask the grower or '
            'seller if the plant is sun-trained. Leaf color tends to be better among plants that grow best with more light.'
            '\n      Most Alocasia species will survive in shade, but they often appreciate slightly brighter filtered sunlight. '
            'The bigger varieties can be trained to handle the full tropical sun.'
            '\n\nWater:'
            '\n      Keep Alocasia plants moist all year; they are water-loving plants. There is a fine line with these plants. '
            'You want to keep the soil moist but not soggy. They require less water during the winter months because the plant '
            'is dormant.\n      Allow the top few inches of soil to become nearly dry before watering. This will help keep the soil evenly '
            'moist. Soggy soil makes the plant susceptible to fungal infections.'
            '\n\nSoil:'
            '\n      Plant elephant\'s ear in loose, well-drained potting mix or in a crumbly loamy soil. T'
            'hey have a preference for slightly acidic soil, which is provided by a standard peat-based potting mix.'
            '\n\nTemperature and Humidity:'
            '\n      Elephant ear plants will suffer below 60 degrees Fahrenheit. Some varieties will die back during colder weather '
            'and re-sprout from the rhizome. They require, and thrive in, very humid environments. To raise the humidity around your '
            'plant, place it on a tray filled with pebbles and then add water until it rises to just below the bottom of the pot. '
            'Keep them away from cold drafts from windows, doors, and air conditioning.'
            '\n\nFertilizer:'
            '\n      Alocasia can be heavy feeders, especially large specimens. Feed with liquid fertilizer once or twice a month;'
            ' a 20-20-20 formulation is recommended during the growing season.'
            '\n\nPruning:'
            '\n      Pruning your Alocasia is as easy as trimming away its faded leaves. It is normal for leaves to shrivel and die '
            'as new leaves appear.',
        isSelected: false),
    // Plant(
    //     plantId: 9,
    //     price: 1900,
    //     category: 'Outdoor',
    //     plantName: 'Bonsai Plant',
    //     size: 'Small',
    //     rating: 4.5,
    //     humidity: 35,
    //     temperature: '23 - 28',
    //     imageURL: 'assets/images/plant_2.png',
    //     isFavorated: false,
    //     decription:
    //     'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
    //         'even the harshest weather condition.',
    //     isSelected: false),
    //   Plant(
    //       plantId: 10,
    //       price: 699,
    //       category: 'Outdoor',
    //       plantName: 'Microcarpa',
    //       size: 'Small',
    //       rating: 4.5,
    //       humidity: 34,
    //       temperature: '23 - 34',
    //       imageURL: 'assets/images/plant_twelve.png',
    //       isFavorated: true,
    //       decription:
    //       'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
    //           'even the harshest weather condition.',
    //       isSelected: false),
    //   Plant(
    //       plantId: 11,
    //       price: 899,
    //       category: 'Garden',
    //       plantName: 'mogro',
    //       size: 'Small',
    //       rating: 4.5,
    //       humidity: 34,
    //       temperature: '23 - 34',
    //       imageURL: 'assets/images/plant_1.png',
    //       isFavorated: true,
    //       decription:
    //       'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
    //           'even the harshest weather condition.',
    //       isSelected: false),
    //   Plant(
    //       plantId: 12,
    //       price: 345,
    //       category: 'Indoor',
    //       plantName: 'rozzz',
    //       size: 'Small',
    //       rating: 4.5,
    //       humidity: 34,
    //       temperature: '23 - 34',
    //       imageURL: 'assets/images/plant_3.png',
    //       isFavorated: true,
    //       decription:
    //       'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
    //           'even the harshest weather condition.',
    //       isSelected: false),
    //   Plant(
    //       plantId: 13,
    //       price: 670,
    //       category: 'Indoor',
    //       plantName: '1',
    //       size: 'Small',
    //       rating: 4.5,
    //       humidity: 34,
    //       temperature: '23 - 34',
    //       imageURL: 'assets/images/plant_4.png',
    //       isFavorated: true,
    //       decription:
    //       'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
    //           'even the harshest weather condition.',
    //       isSelected: false),
    //   Plant(
    //       plantId: 14,
    //       price: 760,
    //       category: 'Indoor',
    //       plantName: '2',
    //       size: 'Small',
    //       rating: 4.5,
    //       humidity: 34,
    //       temperature: '23 - 34',
    //       imageURL: 'assets/images/plant_5.png',
    //       isFavorated: true,
    //       decription:
    //       'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
    //           'even the harshest weather condition.',
    //       isSelected: false),
    //   Plant(
    //       plantId: 15,
    //       price: 675,
    //       category: 'Indoor',
    //       plantName: '3',
    //       size: 'Small',
    //       rating: 4.5,
    //       humidity: 34,
    //       temperature: '23 - 34',
    //       imageURL: 'assets/images/plant_6.png',
    //       isFavorated: true,
    //       decription:
    //       'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
    //           'even the harshest weather condition.',
    //       isSelected: false),
    //   Plant(
    //       plantId: 16,
    //       price: 570,
    //       category: 'Indoor',
    //       plantName: '4',
    //       size: 'Small',
    //       rating: 4.5,
    //       humidity: 34,
    //       temperature: '23 - 34',
    //       imageURL: 'assets/images/plant_7.png',
    //       isFavorated: true,
    //       decription:
    //       'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
    //           'even the harshest weather condition.',
    //       isSelected: false),
    //   Plant(
    //       plantId: 17,
    //       price: 870,
    //       category: 'Indoor',
    //       plantName: '5',
    //       size: 'Small',
    //       rating: 4.5,
    //       humidity: 34,
    //       temperature: '23 - 34',
    //       imageURL: 'assets/images/plant_8.png',
    //       isFavorated: true,
    //       decription:
    //       'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
    //           'even the harshest weather condition.',
    //       isSelected: false),
    //   Plant(
    //       plantId: 18,
    //       price: 780,
    //       category: 'Indoor',
    //       plantName: '6',
    //       size: 'Small',
    //       rating: 4.5,
    //       humidity: 34,
    //       temperature: '23 - 34',
    //       imageURL: 'assets/images/plant_9.png',
    //       isFavorated: true,
    //       decription:
    //       'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
    //           'even the harshest weather condition.',
    //       isSelected: false),
    //   Plant(
    //       plantId: 19,
    //       price: 970,
    //       category: 'Indoor',
    //       plantName: '7',
    //       size: 'Small',
    //       rating: 4.5,
    //       humidity: 34,
    //       temperature: '23 - 34',
    //       imageURL: 'assets/images/plant_10.png',
    //       isFavorated: true,
    //       decription:
    //       'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
    //           'even the harshest weather condition.',
    //       isSelected: false),
    //   Plant(
    //       plantId:20,
    //       price: 545,
    //       category: 'Indoor',
    //       plantName: '8',
    //       size: 'Small',
    //       rating: 4.5,
    //       humidity: 34,
    //       temperature: '23 - 34',
    //       imageURL: 'assets/images/plant_11.png',
    //       isFavorated: true,
    //       decription:
    //       'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
    //           'even the harshest weather condition.',
    //       isSelected: false),
  ];

  //Get the favorated items
  static List<Plant> getFavoritedPlants() {
    List<Plant> _travelList = Plant.plantList;
    return _travelList.where((element) => element.isFavorated == true).toList();
  }

  //Get the cart items
  static List<Plant> addedToCartPlants() {
    List<Plant> _selectedPlants = Plant.plantList;
    return _selectedPlants
        .where((element) => element.isSelected == true)
        .toList();
  }
}
