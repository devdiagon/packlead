import 'package:flutter/material.dart';
import 'package:packlead/core/models/dispatcher.dart';
import 'package:packlead/features/admin/presentation/widgets/dispatcher_detail_dialog.dart';

class DispatcherItemList extends StatelessWidget {
  final Dispatcher dispatcher;

  const DispatcherItemList({super.key, required this.dispatcher});

  Color _getStateColor() {
    switch (dispatcher.state.toLowerCase()) {
      case 'activo':
        return Colors.green;
      case 'inactivo':
        return Colors.grey;
      case 'en ruta':
        return Colors.blue;
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => DispatcherDetailDialog(dispatcher: dispatcher),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Theme.of(context).primaryColor.withValues(alpha: 0.3),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Icon(
                  Icons.person,
                  color: Theme.of(context).primaryColor,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dispatcher.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 6),

                    Text(
                      dispatcher.email,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              // Badge de estado (derecha)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: _getStateColor().withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: _getStateColor(),
                    width: 1,
                  ),
                ),
                child: Text(
                  dispatcher.state,
                  style: TextStyle(
                    color: _getStateColor(),
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
