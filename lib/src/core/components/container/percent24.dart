import 'package:flutter/material.dart';

class Percent24H extends Container {
  Percent24H({Key? key, required double value})
      : super(
          key: key,
          alignment: Alignment.center,
          constraints: const BoxConstraints(
            minWidth: 50,
            minHeight: 20,
            maxHeight: 35,
            maxWidth: 65,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: value.toString().contains('-') ? Colors.red : Colors.green,
          ),
          child: Text(
            '${value.toStringAsFixed(2)}%',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
}
