// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderDTO _$OrderDTOFromJson(Map<String, dynamic> json) {
  return _OrderDTO.fromJson(json);
}

/// @nodoc
mixin _$OrderDTO {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  int? get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  int? get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'result_price')
  double? get resultPrice => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'status_id')
  int? get statusId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'partner_id')
  int? get partnerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'chat_id')
  int? get chatId => throw _privateConstructorUsedError;
  int? get installment => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_type')
  String? get deliveryType => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  ProductDTO? get product => throw _privateConstructorUsedError;
  OrderWithAddressDTO? get order => throw _privateConstructorUsedError;
  @JsonKey(name: 'partner_address')
  AddressDTO? get partnerAddress => throw _privateConstructorUsedError;
  UserDTO? get user => throw _privateConstructorUsedError;

  /// Serializes this OrderDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderDTOCopyWith<OrderDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDTOCopyWith<$Res> {
  factory $OrderDTOCopyWith(OrderDTO value, $Res Function(OrderDTO) then) =
      _$OrderDTOCopyWithImpl<$Res, OrderDTO>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'order_id') int? orderId,
      @JsonKey(name: 'product_id') int? productId,
      @JsonKey(name: 'result_price') double? resultPrice,
      int? quantity,
      @JsonKey(name: 'status_id') int? statusId,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'partner_id') int? partnerId,
      @JsonKey(name: 'chat_id') int? chatId,
      int? installment,
      String? date,
      String? time,
      @JsonKey(name: 'delivery_type') String? deliveryType,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      ProductDTO? product,
      OrderWithAddressDTO? order,
      @JsonKey(name: 'partner_address') AddressDTO? partnerAddress,
      UserDTO? user});

  $ProductDTOCopyWith<$Res>? get product;
  $OrderWithAddressDTOCopyWith<$Res>? get order;
  $AddressDTOCopyWith<$Res>? get partnerAddress;
  $UserDTOCopyWith<$Res>? get user;
}

/// @nodoc
class _$OrderDTOCopyWithImpl<$Res, $Val extends OrderDTO>
    implements $OrderDTOCopyWith<$Res> {
  _$OrderDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? orderId = freezed,
    Object? productId = freezed,
    Object? resultPrice = freezed,
    Object? quantity = freezed,
    Object? statusId = freezed,
    Object? userId = freezed,
    Object? partnerId = freezed,
    Object? chatId = freezed,
    Object? installment = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? deliveryType = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? product = freezed,
    Object? order = freezed,
    Object? partnerAddress = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      resultPrice: freezed == resultPrice
          ? _value.resultPrice
          : resultPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      statusId: freezed == statusId
          ? _value.statusId
          : statusId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      partnerId: freezed == partnerId
          ? _value.partnerId
          : partnerId // ignore: cast_nullable_to_non_nullable
              as int?,
      chatId: freezed == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int?,
      installment: freezed == installment
          ? _value.installment
          : installment // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryType: freezed == deliveryType
          ? _value.deliveryType
          : deliveryType // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductDTO?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderWithAddressDTO?,
      partnerAddress: freezed == partnerAddress
          ? _value.partnerAddress
          : partnerAddress // ignore: cast_nullable_to_non_nullable
              as AddressDTO?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDTO?,
    ) as $Val);
  }

  /// Create a copy of OrderDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductDTOCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductDTOCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }

  /// Create a copy of OrderDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderWithAddressDTOCopyWith<$Res>? get order {
    if (_value.order == null) {
      return null;
    }

    return $OrderWithAddressDTOCopyWith<$Res>(_value.order!, (value) {
      return _then(_value.copyWith(order: value) as $Val);
    });
  }

  /// Create a copy of OrderDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressDTOCopyWith<$Res>? get partnerAddress {
    if (_value.partnerAddress == null) {
      return null;
    }

    return $AddressDTOCopyWith<$Res>(_value.partnerAddress!, (value) {
      return _then(_value.copyWith(partnerAddress: value) as $Val);
    });
  }

  /// Create a copy of OrderDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDTOCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserDTOCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderDTOImplCopyWith<$Res>
    implements $OrderDTOCopyWith<$Res> {
  factory _$$OrderDTOImplCopyWith(
          _$OrderDTOImpl value, $Res Function(_$OrderDTOImpl) then) =
      __$$OrderDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'order_id') int? orderId,
      @JsonKey(name: 'product_id') int? productId,
      @JsonKey(name: 'result_price') double? resultPrice,
      int? quantity,
      @JsonKey(name: 'status_id') int? statusId,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'partner_id') int? partnerId,
      @JsonKey(name: 'chat_id') int? chatId,
      int? installment,
      String? date,
      String? time,
      @JsonKey(name: 'delivery_type') String? deliveryType,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      ProductDTO? product,
      OrderWithAddressDTO? order,
      @JsonKey(name: 'partner_address') AddressDTO? partnerAddress,
      UserDTO? user});

  @override
  $ProductDTOCopyWith<$Res>? get product;
  @override
  $OrderWithAddressDTOCopyWith<$Res>? get order;
  @override
  $AddressDTOCopyWith<$Res>? get partnerAddress;
  @override
  $UserDTOCopyWith<$Res>? get user;
}

/// @nodoc
class __$$OrderDTOImplCopyWithImpl<$Res>
    extends _$OrderDTOCopyWithImpl<$Res, _$OrderDTOImpl>
    implements _$$OrderDTOImplCopyWith<$Res> {
  __$$OrderDTOImplCopyWithImpl(
      _$OrderDTOImpl _value, $Res Function(_$OrderDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? orderId = freezed,
    Object? productId = freezed,
    Object? resultPrice = freezed,
    Object? quantity = freezed,
    Object? statusId = freezed,
    Object? userId = freezed,
    Object? partnerId = freezed,
    Object? chatId = freezed,
    Object? installment = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? deliveryType = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? product = freezed,
    Object? order = freezed,
    Object? partnerAddress = freezed,
    Object? user = freezed,
  }) {
    return _then(_$OrderDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      resultPrice: freezed == resultPrice
          ? _value.resultPrice
          : resultPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      statusId: freezed == statusId
          ? _value.statusId
          : statusId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      partnerId: freezed == partnerId
          ? _value.partnerId
          : partnerId // ignore: cast_nullable_to_non_nullable
              as int?,
      chatId: freezed == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int?,
      installment: freezed == installment
          ? _value.installment
          : installment // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryType: freezed == deliveryType
          ? _value.deliveryType
          : deliveryType // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductDTO?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderWithAddressDTO?,
      partnerAddress: freezed == partnerAddress
          ? _value.partnerAddress
          : partnerAddress // ignore: cast_nullable_to_non_nullable
              as AddressDTO?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDTO?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderDTOImpl implements _OrderDTO {
  const _$OrderDTOImpl(
      {this.id,
      @JsonKey(name: 'order_id') this.orderId,
      @JsonKey(name: 'product_id') this.productId,
      @JsonKey(name: 'result_price') this.resultPrice,
      this.quantity,
      @JsonKey(name: 'status_id') this.statusId,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'partner_id') this.partnerId,
      @JsonKey(name: 'chat_id') this.chatId,
      this.installment,
      this.date,
      this.time,
      @JsonKey(name: 'delivery_type') this.deliveryType,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      this.product,
      this.order,
      @JsonKey(name: 'partner_address') this.partnerAddress,
      this.user});

  factory _$OrderDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderDTOImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'order_id')
  final int? orderId;
  @override
  @JsonKey(name: 'product_id')
  final int? productId;
  @override
  @JsonKey(name: 'result_price')
  final double? resultPrice;
  @override
  final int? quantity;
  @override
  @JsonKey(name: 'status_id')
  final int? statusId;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'partner_id')
  final int? partnerId;
  @override
  @JsonKey(name: 'chat_id')
  final int? chatId;
  @override
  final int? installment;
  @override
  final String? date;
  @override
  final String? time;
  @override
  @JsonKey(name: 'delivery_type')
  final String? deliveryType;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @override
  final ProductDTO? product;
  @override
  final OrderWithAddressDTO? order;
  @override
  @JsonKey(name: 'partner_address')
  final AddressDTO? partnerAddress;
  @override
  final UserDTO? user;

  @override
  String toString() {
    return 'OrderDTO(id: $id, orderId: $orderId, productId: $productId, resultPrice: $resultPrice, quantity: $quantity, statusId: $statusId, userId: $userId, partnerId: $partnerId, chatId: $chatId, installment: $installment, date: $date, time: $time, deliveryType: $deliveryType, createdAt: $createdAt, updatedAt: $updatedAt, product: $product, order: $order, partnerAddress: $partnerAddress, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.resultPrice, resultPrice) ||
                other.resultPrice == resultPrice) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.statusId, statusId) ||
                other.statusId == statusId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.partnerId, partnerId) ||
                other.partnerId == partnerId) &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            (identical(other.installment, installment) ||
                other.installment == installment) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.deliveryType, deliveryType) ||
                other.deliveryType == deliveryType) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.partnerAddress, partnerAddress) ||
                other.partnerAddress == partnerAddress) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        orderId,
        productId,
        resultPrice,
        quantity,
        statusId,
        userId,
        partnerId,
        chatId,
        installment,
        date,
        time,
        deliveryType,
        createdAt,
        updatedAt,
        product,
        order,
        partnerAddress,
        user
      ]);

  /// Create a copy of OrderDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderDTOImplCopyWith<_$OrderDTOImpl> get copyWith =>
      __$$OrderDTOImplCopyWithImpl<_$OrderDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderDTOImplToJson(
      this,
    );
  }
}

abstract class _OrderDTO implements OrderDTO {
  const factory _OrderDTO(
      {final int? id,
      @JsonKey(name: 'order_id') final int? orderId,
      @JsonKey(name: 'product_id') final int? productId,
      @JsonKey(name: 'result_price') final double? resultPrice,
      final int? quantity,
      @JsonKey(name: 'status_id') final int? statusId,
      @JsonKey(name: 'user_id') final int? userId,
      @JsonKey(name: 'partner_id') final int? partnerId,
      @JsonKey(name: 'chat_id') final int? chatId,
      final int? installment,
      final String? date,
      final String? time,
      @JsonKey(name: 'delivery_type') final String? deliveryType,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt,
      final ProductDTO? product,
      final OrderWithAddressDTO? order,
      @JsonKey(name: 'partner_address') final AddressDTO? partnerAddress,
      final UserDTO? user}) = _$OrderDTOImpl;

  factory _OrderDTO.fromJson(Map<String, dynamic> json) =
      _$OrderDTOImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'order_id')
  int? get orderId;
  @override
  @JsonKey(name: 'product_id')
  int? get productId;
  @override
  @JsonKey(name: 'result_price')
  double? get resultPrice;
  @override
  int? get quantity;
  @override
  @JsonKey(name: 'status_id')
  int? get statusId;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'partner_id')
  int? get partnerId;
  @override
  @JsonKey(name: 'chat_id')
  int? get chatId;
  @override
  int? get installment;
  @override
  String? get date;
  @override
  String? get time;
  @override
  @JsonKey(name: 'delivery_type')
  String? get deliveryType;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  ProductDTO? get product;
  @override
  OrderWithAddressDTO? get order;
  @override
  @JsonKey(name: 'partner_address')
  AddressDTO? get partnerAddress;
  @override
  UserDTO? get user;

  /// Create a copy of OrderDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderDTOImplCopyWith<_$OrderDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductDTO _$ProductDTOFromJson(Map<String, dynamic> json) {
  return _ProductDTO.fromJson(json);
}

/// @nodoc
mixin _$ProductDTO {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'catalog_id')
  int? get catalogId => throw _privateConstructorUsedError;
  @JsonKey(name: 'subcatalog_id')
  int? get subcatalogId => throw _privateConstructorUsedError;
  int? get installment => throw _privateConstructorUsedError;
  @JsonKey(name: 'color_id')
  int? get colorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'partner_id')
  int? get partnerId => throw _privateConstructorUsedError;
  int? get recommendation => throw _privateConstructorUsedError;
  @JsonKey(name: 'recommendation_date')
  String? get recommendationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'auto_extend')
  int? get autoExtend => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ProductDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductDTOCopyWith<ProductDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDTOCopyWith<$Res> {
  factory $ProductDTOCopyWith(
          ProductDTO value, $Res Function(ProductDTO) then) =
      _$ProductDTOCopyWithImpl<$Res, ProductDTO>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? description,
      double? price,
      @JsonKey(name: 'catalog_id') int? catalogId,
      @JsonKey(name: 'subcatalog_id') int? subcatalogId,
      int? installment,
      @JsonKey(name: 'color_id') int? colorId,
      @JsonKey(name: 'partner_id') int? partnerId,
      int? recommendation,
      @JsonKey(name: 'recommendation_date') String? recommendationDate,
      @JsonKey(name: 'auto_extend') int? autoExtend,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class _$ProductDTOCopyWithImpl<$Res, $Val extends ProductDTO>
    implements $ProductDTOCopyWith<$Res> {
  _$ProductDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? catalogId = freezed,
    Object? subcatalogId = freezed,
    Object? installment = freezed,
    Object? colorId = freezed,
    Object? partnerId = freezed,
    Object? recommendation = freezed,
    Object? recommendationDate = freezed,
    Object? autoExtend = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      catalogId: freezed == catalogId
          ? _value.catalogId
          : catalogId // ignore: cast_nullable_to_non_nullable
              as int?,
      subcatalogId: freezed == subcatalogId
          ? _value.subcatalogId
          : subcatalogId // ignore: cast_nullable_to_non_nullable
              as int?,
      installment: freezed == installment
          ? _value.installment
          : installment // ignore: cast_nullable_to_non_nullable
              as int?,
      colorId: freezed == colorId
          ? _value.colorId
          : colorId // ignore: cast_nullable_to_non_nullable
              as int?,
      partnerId: freezed == partnerId
          ? _value.partnerId
          : partnerId // ignore: cast_nullable_to_non_nullable
              as int?,
      recommendation: freezed == recommendation
          ? _value.recommendation
          : recommendation // ignore: cast_nullable_to_non_nullable
              as int?,
      recommendationDate: freezed == recommendationDate
          ? _value.recommendationDate
          : recommendationDate // ignore: cast_nullable_to_non_nullable
              as String?,
      autoExtend: freezed == autoExtend
          ? _value.autoExtend
          : autoExtend // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductDTOImplCopyWith<$Res>
    implements $ProductDTOCopyWith<$Res> {
  factory _$$ProductDTOImplCopyWith(
          _$ProductDTOImpl value, $Res Function(_$ProductDTOImpl) then) =
      __$$ProductDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? description,
      double? price,
      @JsonKey(name: 'catalog_id') int? catalogId,
      @JsonKey(name: 'subcatalog_id') int? subcatalogId,
      int? installment,
      @JsonKey(name: 'color_id') int? colorId,
      @JsonKey(name: 'partner_id') int? partnerId,
      int? recommendation,
      @JsonKey(name: 'recommendation_date') String? recommendationDate,
      @JsonKey(name: 'auto_extend') int? autoExtend,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class __$$ProductDTOImplCopyWithImpl<$Res>
    extends _$ProductDTOCopyWithImpl<$Res, _$ProductDTOImpl>
    implements _$$ProductDTOImplCopyWith<$Res> {
  __$$ProductDTOImplCopyWithImpl(
      _$ProductDTOImpl _value, $Res Function(_$ProductDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? catalogId = freezed,
    Object? subcatalogId = freezed,
    Object? installment = freezed,
    Object? colorId = freezed,
    Object? partnerId = freezed,
    Object? recommendation = freezed,
    Object? recommendationDate = freezed,
    Object? autoExtend = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ProductDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      catalogId: freezed == catalogId
          ? _value.catalogId
          : catalogId // ignore: cast_nullable_to_non_nullable
              as int?,
      subcatalogId: freezed == subcatalogId
          ? _value.subcatalogId
          : subcatalogId // ignore: cast_nullable_to_non_nullable
              as int?,
      installment: freezed == installment
          ? _value.installment
          : installment // ignore: cast_nullable_to_non_nullable
              as int?,
      colorId: freezed == colorId
          ? _value.colorId
          : colorId // ignore: cast_nullable_to_non_nullable
              as int?,
      partnerId: freezed == partnerId
          ? _value.partnerId
          : partnerId // ignore: cast_nullable_to_non_nullable
              as int?,
      recommendation: freezed == recommendation
          ? _value.recommendation
          : recommendation // ignore: cast_nullable_to_non_nullable
              as int?,
      recommendationDate: freezed == recommendationDate
          ? _value.recommendationDate
          : recommendationDate // ignore: cast_nullable_to_non_nullable
              as String?,
      autoExtend: freezed == autoExtend
          ? _value.autoExtend
          : autoExtend // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductDTOImpl implements _ProductDTO {
  const _$ProductDTOImpl(
      {this.id,
      this.name,
      this.description,
      this.price,
      @JsonKey(name: 'catalog_id') this.catalogId,
      @JsonKey(name: 'subcatalog_id') this.subcatalogId,
      this.installment,
      @JsonKey(name: 'color_id') this.colorId,
      @JsonKey(name: 'partner_id') this.partnerId,
      this.recommendation,
      @JsonKey(name: 'recommendation_date') this.recommendationDate,
      @JsonKey(name: 'auto_extend') this.autoExtend,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$ProductDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductDTOImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final double? price;
  @override
  @JsonKey(name: 'catalog_id')
  final int? catalogId;
  @override
  @JsonKey(name: 'subcatalog_id')
  final int? subcatalogId;
  @override
  final int? installment;
  @override
  @JsonKey(name: 'color_id')
  final int? colorId;
  @override
  @JsonKey(name: 'partner_id')
  final int? partnerId;
  @override
  final int? recommendation;
  @override
  @JsonKey(name: 'recommendation_date')
  final String? recommendationDate;
  @override
  @JsonKey(name: 'auto_extend')
  final int? autoExtend;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'ProductDTO(id: $id, name: $name, description: $description, price: $price, catalogId: $catalogId, subcatalogId: $subcatalogId, installment: $installment, colorId: $colorId, partnerId: $partnerId, recommendation: $recommendation, recommendationDate: $recommendationDate, autoExtend: $autoExtend, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.catalogId, catalogId) ||
                other.catalogId == catalogId) &&
            (identical(other.subcatalogId, subcatalogId) ||
                other.subcatalogId == subcatalogId) &&
            (identical(other.installment, installment) ||
                other.installment == installment) &&
            (identical(other.colorId, colorId) || other.colorId == colorId) &&
            (identical(other.partnerId, partnerId) ||
                other.partnerId == partnerId) &&
            (identical(other.recommendation, recommendation) ||
                other.recommendation == recommendation) &&
            (identical(other.recommendationDate, recommendationDate) ||
                other.recommendationDate == recommendationDate) &&
            (identical(other.autoExtend, autoExtend) ||
                other.autoExtend == autoExtend) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      price,
      catalogId,
      subcatalogId,
      installment,
      colorId,
      partnerId,
      recommendation,
      recommendationDate,
      autoExtend,
      createdAt,
      updatedAt);

  /// Create a copy of ProductDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductDTOImplCopyWith<_$ProductDTOImpl> get copyWith =>
      __$$ProductDTOImplCopyWithImpl<_$ProductDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductDTOImplToJson(
      this,
    );
  }
}

abstract class _ProductDTO implements ProductDTO {
  const factory _ProductDTO(
      {final int? id,
      final String? name,
      final String? description,
      final double? price,
      @JsonKey(name: 'catalog_id') final int? catalogId,
      @JsonKey(name: 'subcatalog_id') final int? subcatalogId,
      final int? installment,
      @JsonKey(name: 'color_id') final int? colorId,
      @JsonKey(name: 'partner_id') final int? partnerId,
      final int? recommendation,
      @JsonKey(name: 'recommendation_date') final String? recommendationDate,
      @JsonKey(name: 'auto_extend') final int? autoExtend,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt}) = _$ProductDTOImpl;

  factory _ProductDTO.fromJson(Map<String, dynamic> json) =
      _$ProductDTOImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  double? get price;
  @override
  @JsonKey(name: 'catalog_id')
  int? get catalogId;
  @override
  @JsonKey(name: 'subcatalog_id')
  int? get subcatalogId;
  @override
  int? get installment;
  @override
  @JsonKey(name: 'color_id')
  int? get colorId;
  @override
  @JsonKey(name: 'partner_id')
  int? get partnerId;
  @override
  int? get recommendation;
  @override
  @JsonKey(name: 'recommendation_date')
  String? get recommendationDate;
  @override
  @JsonKey(name: 'auto_extend')
  int? get autoExtend;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;

  /// Create a copy of ProductDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductDTOImplCopyWith<_$ProductDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderWithAddressDTO _$OrderWithAddressDTOFromJson(Map<String, dynamic> json) {
  return _OrderWithAddressDTO.fromJson(json);
}

/// @nodoc
mixin _$OrderWithAddressDTO {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_id')
  int? get addressId => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_type')
  String? get deliveryType => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_type')
  String? get paymentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'used_bonus')
  int? get usedBonus => throw _privateConstructorUsedError;
  String? get promocode => throw _privateConstructorUsedError;
  @JsonKey(name: 'sum_products_price')
  double? get sumProductsPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_price')
  double? get deliveryPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_price')
  double? get totalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  AddressDTO? get address => throw _privateConstructorUsedError;

  /// Serializes this OrderWithAddressDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderWithAddressDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderWithAddressDTOCopyWith<OrderWithAddressDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderWithAddressDTOCopyWith<$Res> {
  factory $OrderWithAddressDTOCopyWith(
          OrderWithAddressDTO value, $Res Function(OrderWithAddressDTO) then) =
      _$OrderWithAddressDTOCopyWithImpl<$Res, OrderWithAddressDTO>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'address_id') int? addressId,
      @JsonKey(name: 'delivery_type') String? deliveryType,
      @JsonKey(name: 'payment_type') String? paymentType,
      @JsonKey(name: 'used_bonus') int? usedBonus,
      String? promocode,
      @JsonKey(name: 'sum_products_price') double? sumProductsPrice,
      @JsonKey(name: 'delivery_price') double? deliveryPrice,
      @JsonKey(name: 'total_price') double? totalPrice,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      AddressDTO? address});

  $AddressDTOCopyWith<$Res>? get address;
}

/// @nodoc
class _$OrderWithAddressDTOCopyWithImpl<$Res, $Val extends OrderWithAddressDTO>
    implements $OrderWithAddressDTOCopyWith<$Res> {
  _$OrderWithAddressDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderWithAddressDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? addressId = freezed,
    Object? deliveryType = freezed,
    Object? paymentType = freezed,
    Object? usedBonus = freezed,
    Object? promocode = freezed,
    Object? sumProductsPrice = freezed,
    Object? deliveryPrice = freezed,
    Object? totalPrice = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      addressId: freezed == addressId
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as int?,
      deliveryType: freezed == deliveryType
          ? _value.deliveryType
          : deliveryType // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentType: freezed == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String?,
      usedBonus: freezed == usedBonus
          ? _value.usedBonus
          : usedBonus // ignore: cast_nullable_to_non_nullable
              as int?,
      promocode: freezed == promocode
          ? _value.promocode
          : promocode // ignore: cast_nullable_to_non_nullable
              as String?,
      sumProductsPrice: freezed == sumProductsPrice
          ? _value.sumProductsPrice
          : sumProductsPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryPrice: freezed == deliveryPrice
          ? _value.deliveryPrice
          : deliveryPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressDTO?,
    ) as $Val);
  }

  /// Create a copy of OrderWithAddressDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressDTOCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressDTOCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderWithAddressDTOImplCopyWith<$Res>
    implements $OrderWithAddressDTOCopyWith<$Res> {
  factory _$$OrderWithAddressDTOImplCopyWith(_$OrderWithAddressDTOImpl value,
          $Res Function(_$OrderWithAddressDTOImpl) then) =
      __$$OrderWithAddressDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'address_id') int? addressId,
      @JsonKey(name: 'delivery_type') String? deliveryType,
      @JsonKey(name: 'payment_type') String? paymentType,
      @JsonKey(name: 'used_bonus') int? usedBonus,
      String? promocode,
      @JsonKey(name: 'sum_products_price') double? sumProductsPrice,
      @JsonKey(name: 'delivery_price') double? deliveryPrice,
      @JsonKey(name: 'total_price') double? totalPrice,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      AddressDTO? address});

  @override
  $AddressDTOCopyWith<$Res>? get address;
}

/// @nodoc
class __$$OrderWithAddressDTOImplCopyWithImpl<$Res>
    extends _$OrderWithAddressDTOCopyWithImpl<$Res, _$OrderWithAddressDTOImpl>
    implements _$$OrderWithAddressDTOImplCopyWith<$Res> {
  __$$OrderWithAddressDTOImplCopyWithImpl(_$OrderWithAddressDTOImpl _value,
      $Res Function(_$OrderWithAddressDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderWithAddressDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? addressId = freezed,
    Object? deliveryType = freezed,
    Object? paymentType = freezed,
    Object? usedBonus = freezed,
    Object? promocode = freezed,
    Object? sumProductsPrice = freezed,
    Object? deliveryPrice = freezed,
    Object? totalPrice = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? address = freezed,
  }) {
    return _then(_$OrderWithAddressDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      addressId: freezed == addressId
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as int?,
      deliveryType: freezed == deliveryType
          ? _value.deliveryType
          : deliveryType // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentType: freezed == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String?,
      usedBonus: freezed == usedBonus
          ? _value.usedBonus
          : usedBonus // ignore: cast_nullable_to_non_nullable
              as int?,
      promocode: freezed == promocode
          ? _value.promocode
          : promocode // ignore: cast_nullable_to_non_nullable
              as String?,
      sumProductsPrice: freezed == sumProductsPrice
          ? _value.sumProductsPrice
          : sumProductsPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryPrice: freezed == deliveryPrice
          ? _value.deliveryPrice
          : deliveryPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressDTO?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderWithAddressDTOImpl implements _OrderWithAddressDTO {
  const _$OrderWithAddressDTOImpl(
      {this.id,
      @JsonKey(name: 'address_id') this.addressId,
      @JsonKey(name: 'delivery_type') this.deliveryType,
      @JsonKey(name: 'payment_type') this.paymentType,
      @JsonKey(name: 'used_bonus') this.usedBonus,
      this.promocode,
      @JsonKey(name: 'sum_products_price') this.sumProductsPrice,
      @JsonKey(name: 'delivery_price') this.deliveryPrice,
      @JsonKey(name: 'total_price') this.totalPrice,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      this.address});

  factory _$OrderWithAddressDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderWithAddressDTOImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'address_id')
  final int? addressId;
  @override
  @JsonKey(name: 'delivery_type')
  final String? deliveryType;
  @override
  @JsonKey(name: 'payment_type')
  final String? paymentType;
  @override
  @JsonKey(name: 'used_bonus')
  final int? usedBonus;
  @override
  final String? promocode;
  @override
  @JsonKey(name: 'sum_products_price')
  final double? sumProductsPrice;
  @override
  @JsonKey(name: 'delivery_price')
  final double? deliveryPrice;
  @override
  @JsonKey(name: 'total_price')
  final double? totalPrice;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @override
  final AddressDTO? address;

  @override
  String toString() {
    return 'OrderWithAddressDTO(id: $id, addressId: $addressId, deliveryType: $deliveryType, paymentType: $paymentType, usedBonus: $usedBonus, promocode: $promocode, sumProductsPrice: $sumProductsPrice, deliveryPrice: $deliveryPrice, totalPrice: $totalPrice, createdAt: $createdAt, updatedAt: $updatedAt, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderWithAddressDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.addressId, addressId) ||
                other.addressId == addressId) &&
            (identical(other.deliveryType, deliveryType) ||
                other.deliveryType == deliveryType) &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType) &&
            (identical(other.usedBonus, usedBonus) ||
                other.usedBonus == usedBonus) &&
            (identical(other.promocode, promocode) ||
                other.promocode == promocode) &&
            (identical(other.sumProductsPrice, sumProductsPrice) ||
                other.sumProductsPrice == sumProductsPrice) &&
            (identical(other.deliveryPrice, deliveryPrice) ||
                other.deliveryPrice == deliveryPrice) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      addressId,
      deliveryType,
      paymentType,
      usedBonus,
      promocode,
      sumProductsPrice,
      deliveryPrice,
      totalPrice,
      createdAt,
      updatedAt,
      address);

  /// Create a copy of OrderWithAddressDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderWithAddressDTOImplCopyWith<_$OrderWithAddressDTOImpl> get copyWith =>
      __$$OrderWithAddressDTOImplCopyWithImpl<_$OrderWithAddressDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderWithAddressDTOImplToJson(
      this,
    );
  }
}

abstract class _OrderWithAddressDTO implements OrderWithAddressDTO {
  const factory _OrderWithAddressDTO(
      {final int? id,
      @JsonKey(name: 'address_id') final int? addressId,
      @JsonKey(name: 'delivery_type') final String? deliveryType,
      @JsonKey(name: 'payment_type') final String? paymentType,
      @JsonKey(name: 'used_bonus') final int? usedBonus,
      final String? promocode,
      @JsonKey(name: 'sum_products_price') final double? sumProductsPrice,
      @JsonKey(name: 'delivery_price') final double? deliveryPrice,
      @JsonKey(name: 'total_price') final double? totalPrice,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt,
      final AddressDTO? address}) = _$OrderWithAddressDTOImpl;

  factory _OrderWithAddressDTO.fromJson(Map<String, dynamic> json) =
      _$OrderWithAddressDTOImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'address_id')
  int? get addressId;
  @override
  @JsonKey(name: 'delivery_type')
  String? get deliveryType;
  @override
  @JsonKey(name: 'payment_type')
  String? get paymentType;
  @override
  @JsonKey(name: 'used_bonus')
  int? get usedBonus;
  @override
  String? get promocode;
  @override
  @JsonKey(name: 'sum_products_price')
  double? get sumProductsPrice;
  @override
  @JsonKey(name: 'delivery_price')
  double? get deliveryPrice;
  @override
  @JsonKey(name: 'total_price')
  double? get totalPrice;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  AddressDTO? get address;

  /// Create a copy of OrderWithAddressDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderWithAddressDTOImplCopyWith<_$OrderWithAddressDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AddressDTO _$AddressDTOFromJson(Map<String, dynamic> json) {
  return _AddressDTO.fromJson(json);
}

/// @nodoc
mixin _$AddressDTO {
  int? get id => throw _privateConstructorUsedError;
  String? get street => throw _privateConstructorUsedError;
  @JsonKey(name: 'house_number')
  String? get houseNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'apartment_number')
  String? get apartmentNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'entrance_number')
  String? get entranceNumber => throw _privateConstructorUsedError;
  String? get floor => throw _privateConstructorUsedError;
  @JsonKey(name: 'additional_comment')
  String? get additionalComment => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  int? get partnerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  int? get active => throw _privateConstructorUsedError;

  /// Serializes this AddressDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddressDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressDTOCopyWith<AddressDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressDTOCopyWith<$Res> {
  factory $AddressDTOCopyWith(
          AddressDTO value, $Res Function(AddressDTO) then) =
      _$AddressDTOCopyWithImpl<$Res, AddressDTO>;
  @useResult
  $Res call(
      {int? id,
      String? street,
      @JsonKey(name: 'house_number') String? houseNumber,
      @JsonKey(name: 'apartment_number') String? apartmentNumber,
      @JsonKey(name: 'entrance_number') String? entranceNumber,
      String? floor,
      @JsonKey(name: 'additional_comment') String? additionalComment,
      @JsonKey(name: 'user_id') int? userId,
      String? address,
      String? phone,
      String? time,
      int? partnerId,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      int? active});
}

/// @nodoc
class _$AddressDTOCopyWithImpl<$Res, $Val extends AddressDTO>
    implements $AddressDTOCopyWith<$Res> {
  _$AddressDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddressDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? street = freezed,
    Object? houseNumber = freezed,
    Object? apartmentNumber = freezed,
    Object? entranceNumber = freezed,
    Object? floor = freezed,
    Object? additionalComment = freezed,
    Object? userId = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? time = freezed,
    Object? partnerId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? active = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      houseNumber: freezed == houseNumber
          ? _value.houseNumber
          : houseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      apartmentNumber: freezed == apartmentNumber
          ? _value.apartmentNumber
          : apartmentNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      entranceNumber: freezed == entranceNumber
          ? _value.entranceNumber
          : entranceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalComment: freezed == additionalComment
          ? _value.additionalComment
          : additionalComment // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerId: freezed == partnerId
          ? _value.partnerId
          : partnerId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressDTOImplCopyWith<$Res>
    implements $AddressDTOCopyWith<$Res> {
  factory _$$AddressDTOImplCopyWith(
          _$AddressDTOImpl value, $Res Function(_$AddressDTOImpl) then) =
      __$$AddressDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? street,
      @JsonKey(name: 'house_number') String? houseNumber,
      @JsonKey(name: 'apartment_number') String? apartmentNumber,
      @JsonKey(name: 'entrance_number') String? entranceNumber,
      String? floor,
      @JsonKey(name: 'additional_comment') String? additionalComment,
      @JsonKey(name: 'user_id') int? userId,
      String? address,
      String? phone,
      String? time,
      int? partnerId,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      int? active});
}

/// @nodoc
class __$$AddressDTOImplCopyWithImpl<$Res>
    extends _$AddressDTOCopyWithImpl<$Res, _$AddressDTOImpl>
    implements _$$AddressDTOImplCopyWith<$Res> {
  __$$AddressDTOImplCopyWithImpl(
      _$AddressDTOImpl _value, $Res Function(_$AddressDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddressDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? street = freezed,
    Object? houseNumber = freezed,
    Object? apartmentNumber = freezed,
    Object? entranceNumber = freezed,
    Object? floor = freezed,
    Object? additionalComment = freezed,
    Object? userId = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? time = freezed,
    Object? partnerId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? active = freezed,
  }) {
    return _then(_$AddressDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      houseNumber: freezed == houseNumber
          ? _value.houseNumber
          : houseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      apartmentNumber: freezed == apartmentNumber
          ? _value.apartmentNumber
          : apartmentNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      entranceNumber: freezed == entranceNumber
          ? _value.entranceNumber
          : entranceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalComment: freezed == additionalComment
          ? _value.additionalComment
          : additionalComment // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerId: freezed == partnerId
          ? _value.partnerId
          : partnerId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressDTOImpl implements _AddressDTO {
  const _$AddressDTOImpl(
      {this.id,
      this.street,
      @JsonKey(name: 'house_number') this.houseNumber,
      @JsonKey(name: 'apartment_number') this.apartmentNumber,
      @JsonKey(name: 'entrance_number') this.entranceNumber,
      this.floor,
      @JsonKey(name: 'additional_comment') this.additionalComment,
      @JsonKey(name: 'user_id') this.userId,
      this.address,
      this.phone,
      this.time,
      this.partnerId,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      this.active});

  factory _$AddressDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressDTOImplFromJson(json);

  @override
  final int? id;
  @override
  final String? street;
  @override
  @JsonKey(name: 'house_number')
  final String? houseNumber;
  @override
  @JsonKey(name: 'apartment_number')
  final String? apartmentNumber;
  @override
  @JsonKey(name: 'entrance_number')
  final String? entranceNumber;
  @override
  final String? floor;
  @override
  @JsonKey(name: 'additional_comment')
  final String? additionalComment;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  final String? address;
  @override
  final String? phone;
  @override
  final String? time;
  @override
  final int? partnerId;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  final int? active;

  @override
  String toString() {
    return 'AddressDTO(id: $id, street: $street, houseNumber: $houseNumber, apartmentNumber: $apartmentNumber, entranceNumber: $entranceNumber, floor: $floor, additionalComment: $additionalComment, userId: $userId, address: $address, phone: $phone, time: $time, partnerId: $partnerId, createdAt: $createdAt, updatedAt: $updatedAt, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.houseNumber, houseNumber) ||
                other.houseNumber == houseNumber) &&
            (identical(other.apartmentNumber, apartmentNumber) ||
                other.apartmentNumber == apartmentNumber) &&
            (identical(other.entranceNumber, entranceNumber) ||
                other.entranceNumber == entranceNumber) &&
            (identical(other.floor, floor) || other.floor == floor) &&
            (identical(other.additionalComment, additionalComment) ||
                other.additionalComment == additionalComment) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.partnerId, partnerId) ||
                other.partnerId == partnerId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      street,
      houseNumber,
      apartmentNumber,
      entranceNumber,
      floor,
      additionalComment,
      userId,
      address,
      phone,
      time,
      partnerId,
      createdAt,
      updatedAt,
      active);

  /// Create a copy of AddressDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressDTOImplCopyWith<_$AddressDTOImpl> get copyWith =>
      __$$AddressDTOImplCopyWithImpl<_$AddressDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressDTOImplToJson(
      this,
    );
  }
}

abstract class _AddressDTO implements AddressDTO {
  const factory _AddressDTO(
      {final int? id,
      final String? street,
      @JsonKey(name: 'house_number') final String? houseNumber,
      @JsonKey(name: 'apartment_number') final String? apartmentNumber,
      @JsonKey(name: 'entrance_number') final String? entranceNumber,
      final String? floor,
      @JsonKey(name: 'additional_comment') final String? additionalComment,
      @JsonKey(name: 'user_id') final int? userId,
      final String? address,
      final String? phone,
      final String? time,
      final int? partnerId,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt,
      final int? active}) = _$AddressDTOImpl;

  factory _AddressDTO.fromJson(Map<String, dynamic> json) =
      _$AddressDTOImpl.fromJson;

  @override
  int? get id;
  @override
  String? get street;
  @override
  @JsonKey(name: 'house_number')
  String? get houseNumber;
  @override
  @JsonKey(name: 'apartment_number')
  String? get apartmentNumber;
  @override
  @JsonKey(name: 'entrance_number')
  String? get entranceNumber;
  @override
  String? get floor;
  @override
  @JsonKey(name: 'additional_comment')
  String? get additionalComment;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  String? get address;
  @override
  String? get phone;
  @override
  String? get time;
  @override
  int? get partnerId;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  int? get active;

  /// Create a copy of AddressDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressDTOImplCopyWith<_$AddressDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
