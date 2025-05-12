import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'purchase.freezed.dart';
part 'purchase.g.dart';

/// List of valid purchase types
enum PurchaseType {
  @JsonValue('REVENUE_CAT')
  revenueCat,
}

/// Base model for all purchases
@freezed
class Purchase with _$Purchase {
  const Purchase._();

  const factory Purchase({
    required String id,
    required PurchaseType type,
    required Map<String, dynamic> purchaseData,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Purchase;

  factory Purchase.fromJson(Map<String, dynamic> json) => _$PurchaseFromJson(json);
}
