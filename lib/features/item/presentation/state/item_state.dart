import 'package:equatable/equatable.dart';
import 'package:lost_n_found/features/item/domain/entities/item_entity.dart';

enum ItemStatus { initial, loading, loaded, error, created, updated, deleted }

class ItemState extends Equatable {
  final ItemStatus status;
  final List<ItemEntity> items;
  final List<ItemEntity> lostItems;
  final List<ItemEntity> foundItems;
  final ItemEntity? selectedItem;
  final String? errorMessage;

  const ItemState({
    this.status = ItemStatus.initial,
    this.items = const [],
    this.lostItems = const [],
    this.foundItems = const [],
    this.selectedItem,
    this.errorMessage,
  });

  ItemState copyWith({
    ItemStatus? status,
    List<ItemEntity>? items,
    List<ItemEntity>? lostItems,
    List<ItemEntity>? foundItems,
    ItemEntity? selectedItem,
    String? errorMessage,
  }) {
    return ItemState(
      status: status ?? this.status,
      items: items ?? this.items,
      lostItems: lostItems ?? this.lostItems,
      foundItems: foundItems ?? this.foundItems,
      selectedItem: selectedItem ?? this.selectedItem,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, items, lostItems, foundItems, selectedItem, errorMessage];
}
