// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderDTOImpl _$$OrderDTOImplFromJson(Map<String, dynamic> json) =>
    _$OrderDTOImpl(
      id: (json['id'] as num?)?.toInt(),
      orderId: (json['order_id'] as num?)?.toInt(),
      productId: (json['product_id'] as num?)?.toInt(),
      resultPrice: (json['result_price'] as num?)?.toDouble(),
      quantity: (json['quantity'] as num?)?.toInt(),
      statusId: (json['status_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      partnerId: (json['partner_id'] as num?)?.toInt(),
      chatId: (json['chat_id'] as num?)?.toInt(),
      installment: (json['installment'] as num?)?.toInt(),
      date: json['date'] as String?,
      time: json['time'] as String?,
      deliveryType: json['delivery_type'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      product: json['product'] == null
          ? null
          : ProductDTO.fromJson(json['product'] as Map<String, dynamic>),
      order: json['order'] == null
          ? null
          : OrderWithAddressDTO.fromJson(json['order'] as Map<String, dynamic>),
      partnerAddress: json['partner_address'] == null
          ? null
          : AddressDTO.fromJson(
              json['partner_address'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserDTO.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrderDTOImplToJson(_$OrderDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderId,
      'product_id': instance.productId,
      'result_price': instance.resultPrice,
      'quantity': instance.quantity,
      'status_id': instance.statusId,
      'user_id': instance.userId,
      'partner_id': instance.partnerId,
      'chat_id': instance.chatId,
      'installment': instance.installment,
      'date': instance.date,
      'time': instance.time,
      'delivery_type': instance.deliveryType,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'product': instance.product,
      'order': instance.order,
      'partner_address': instance.partnerAddress,
      'user': instance.user,
    };

_$ProductDTOImpl _$$ProductDTOImplFromJson(Map<String, dynamic> json) =>
    _$ProductDTOImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      catalogId: (json['catalog_id'] as num?)?.toInt(),
      subcatalogId: (json['subcatalog_id'] as num?)?.toInt(),
      installment: (json['installment'] as num?)?.toInt(),
      colorId: (json['color_id'] as num?)?.toInt(),
      partnerId: (json['partner_id'] as num?)?.toInt(),
      recommendation: (json['recommendation'] as num?)?.toInt(),
      recommendationDate: json['recommendation_date'] as String?,
      autoExtend: (json['auto_extend'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$ProductDTOImplToJson(_$ProductDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'catalog_id': instance.catalogId,
      'subcatalog_id': instance.subcatalogId,
      'installment': instance.installment,
      'color_id': instance.colorId,
      'partner_id': instance.partnerId,
      'recommendation': instance.recommendation,
      'recommendation_date': instance.recommendationDate,
      'auto_extend': instance.autoExtend,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

_$OrderWithAddressDTOImpl _$$OrderWithAddressDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderWithAddressDTOImpl(
      id: (json['id'] as num?)?.toInt(),
      addressId: (json['address_id'] as num?)?.toInt(),
      deliveryType: json['delivery_type'] as String?,
      paymentType: json['payment_type'] as String?,
      usedBonus: (json['used_bonus'] as num?)?.toInt(),
      promocode: json['promocode'] as String?,
      sumProductsPrice: (json['sum_products_price'] as num?)?.toDouble(),
      deliveryPrice: (json['delivery_price'] as num?)?.toDouble(),
      totalPrice: (json['total_price'] as num?)?.toDouble(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      address: json['address'] == null
          ? null
          : AddressDTO.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrderWithAddressDTOImplToJson(
        _$OrderWithAddressDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address_id': instance.addressId,
      'delivery_type': instance.deliveryType,
      'payment_type': instance.paymentType,
      'used_bonus': instance.usedBonus,
      'promocode': instance.promocode,
      'sum_products_price': instance.sumProductsPrice,
      'delivery_price': instance.deliveryPrice,
      'total_price': instance.totalPrice,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'address': instance.address,
    };

_$AddressDTOImpl _$$AddressDTOImplFromJson(Map<String, dynamic> json) =>
    _$AddressDTOImpl(
      id: (json['id'] as num?)?.toInt(),
      street: json['street'] as String?,
      houseNumber: json['house_number'] as String?,
      apartmentNumber: json['apartment_number'] as String?,
      entranceNumber: json['entrance_number'] as String?,
      floor: json['floor'] as String?,
      additionalComment: json['additional_comment'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      time: json['time'] as String?,
      partnerId: (json['partnerId'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      active: (json['active'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AddressDTOImplToJson(_$AddressDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'street': instance.street,
      'house_number': instance.houseNumber,
      'apartment_number': instance.apartmentNumber,
      'entrance_number': instance.entranceNumber,
      'floor': instance.floor,
      'additional_comment': instance.additionalComment,
      'user_id': instance.userId,
      'address': instance.address,
      'phone': instance.phone,
      'time': instance.time,
      'partnerId': instance.partnerId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'active': instance.active,
    };
