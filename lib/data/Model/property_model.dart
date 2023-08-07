class PropertyModel {
  int locationId;
  String categoryId;
  int space;
  String description;
  int bathCount;
  int roomCount;
  int floorCount;
  int floorNumber;
  String buildingName;
  bool shared;
  bool isHeatControl;
  bool airConditioning;
  bool fireplace;
  bool ventilationSystem;
  bool isSecurity;
  bool guard;
  bool cameras;
  bool fireAlert;
  bool earthQuake;
  bool isSupplies;
  bool solarPower;
  bool internetAccess;
  bool elevator;
  bool landLine;
  bool mainStreetAccess;
  bool garage;
  bool isLuxry;
  bool pool;
  bool garden;
  bool viewOnSea;
  bool isindustry;
  bool isolation;
  bool rodenControl;
  int capacity;
  bool truckAccessible;
  bool rent;
  String receivingDate;
  String delivareTime;
  int pricePerDay;
  bool purchase;
  int totalPrice;
  int pricePerMeter;

  PropertyModel({
    required this.locationId,
    required this.categoryId,
    required this.space,
    required this.description,
    required this.bathCount,
    required this.roomCount,
    required this.floorCount,
    required this.floorNumber,
    required this.buildingName,
    required this.shared,
    required this.isHeatControl,
    required this.airConditioning,
    required this.fireplace,
    required this.ventilationSystem,
    required this.isSecurity,
    required this.guard,
    required this.cameras,
    required this.fireAlert,
    required this.earthQuake,
    required this.isSupplies,
    required this.solarPower,
    required this.internetAccess,
    required this.elevator,
    required this.landLine,
    required this.mainStreetAccess,
    required this.garage,
    required this.isLuxry,
    required this.pool,
    required this.garden,
    required this.viewOnSea,
    required this.isindustry,
    required this.isolation,
    required this.rodenControl,
    required this.capacity,
    required this.truckAccessible,
    required this.rent,
    required this.receivingDate,
    required this.delivareTime,
    required this.pricePerDay,
    required this.purchase,
    required this.totalPrice,
    required this.pricePerMeter,
  });

  factory PropertyModel.initial() => PropertyModel(
        locationId: 0,
        categoryId: '${0}',
        space: 0,
        description: '',
        bathCount: 0,
        roomCount: 0,
        floorCount: 0,
        floorNumber: 0,
        buildingName: '',
        shared: false,
        isHeatControl: false,
        airConditioning: false,
        fireplace: false,
        ventilationSystem: false,
        isSecurity: false,
        guard: false,
        cameras: false,
        fireAlert: false,
        earthQuake: false,
        isSupplies: false,
        solarPower: false,
        internetAccess: false,
        elevator: false,
        landLine: false,
        mainStreetAccess: false,
        garage: false,
        isLuxry: false,
        pool: false,
        garden: false,
        viewOnSea: false,
        isindustry: false,
        isolation: false,
        rodenControl: false,
        capacity: 0,
        truckAccessible: false,
        rent: false,
        receivingDate: '',
        delivareTime: '',
        pricePerDay: 0,
        purchase: false,
        totalPrice: 0,
        pricePerMeter: 0,
      );

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      locationId: json['location_id'],
      categoryId: json['category_id'],
      space: json['space'],
      description: json['description'],
      bathCount: json['bath_count'],
      roomCount: json['room_count'],
      floorCount: json['floor_count'],
      floorNumber: json['floor_number'],
      buildingName: json['building_name'],
      shared: json['shared'],
      isHeatControl: json['isHeatControl'],
      airConditioning: json['air_condtioning'],
      fireplace: json['fireplace'],
      ventilationSystem: json['ventilation_system'],
      isSecurity: json['isSecurity'],
      guard: json['guard'],
      cameras: json['cameras'],
      fireAlert: json['fire_alert'],
      earthQuake: json['earth_quake'],
      isSupplies: json['isSupplies'],
      solarPower: json['solar_power'],
      internetAccess: json['internet_access'],
      elevator: json['elevator'],
      landLine: json['land_line'],
      mainStreetAccess: json['Main_street_access'],
      garage: json['garage'],
      isLuxry: json['isLuxry'],
      pool: json['pool'],
      garden: json['garden'],
      viewOnSea: json['view_on_sea'],
      isindustry: json['isindustry'],
      isolation: json['isolation'],
      rodenControl: json['roden_control'],
      capacity: json['capacity'],
      truckAccessible: json['truck_accessible'],
      rent: json['Rent'],
      receivingDate: json['receiving_date'],
      delivareTime: json['delivare_time'],
      pricePerDay: json['price_per_day'],
      purchase: json['Purchase'],
      totalPrice: json['total_price'],
      pricePerMeter: json['price_per_meter'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['location_id'] = locationId;
    data['category_id'] = categoryId;
    data['space'] = space;
    data['description'] = description;
    data['bath_count'] = bathCount;
    data['room_count'] = roomCount;
    data['floor_count'] = floorCount;
    data['floor_number'] = floorNumber;
    data['building_name'] = buildingName;
    data['shared'] = shared;
    data['isHeatControl'] = isHeatControl;
    data['air_condtioning'] = airConditioning;
    data['fireplace'] = fireplace;
    data['ventilation_system'] = ventilationSystem;
    data['isSecurity'] = isSecurity;
    data['guard'] = guard;
    data['cameras'] = cameras;
    data['fire_alert'] = fireAlert;
    data['earth_quake'] = earthQuake;
    data['isSupplies'] = isSupplies;
    data['solar_power'] = solarPower;
    data['internet_access'] = internetAccess;
    data['elevator'] = elevator;
    data['land_line'] = landLine;
    data['Main_street_access'] = mainStreetAccess;
    data['garage'] = garage;
    data['isLuxry'] = isLuxry;
    data['pool'] = pool;
    data['garden'] = garden;
    data['view_on_sea'] = viewOnSea;
    data['isindustry'] = isindustry;
    data['isolation'] = isolation;
    data['roden_control'] = rodenControl;
    data['capacity'] = capacity;
    data['truck_accessible'] = truckAccessible;
    data['Rent'] = rent;
    data['receiving_date'] = receivingDate;
    data['delivare_time'] = delivareTime;
    data['price_per_day'] = pricePerDay;
    data['Purchase'] = purchase;
    data['total_price'] = totalPrice;
    data['price_per_meter'] = pricePerMeter;
    return data;
  }
}
