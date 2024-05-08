import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class WindowsTitlebar extends StatelessWidget {
  const WindowsTitlebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const buttonStyle =
        ButtonStyle(fixedSize: MaterialStatePropertyAll(Size(30, 30)));
    return GestureDetector(
      onDoubleTap: () async {
        await windowManager.isFullScreen();
      },
      child: Row(
        children: [
          IconButton(
              style: buttonStyle,
              onPressed: () {},
              icon: const Center(
                child: Icon(
                  Icons.map_rounded,
                  size: 14,
                ),
              )),
          TextButton(onPressed: () {}, child: const Text('New Tab')),
          TextButton(
            onPressed: () {},
            child: const Text('Settings'),
          ),
          const Spacer(),
          IconButton(
              onPressed: () {},
              style: buttonStyle,
              icon: const Icon(
                Icons.minimize_rounded,
                size: 14,
              )),
          IconButton(
              onPressed: () {},
              style: buttonStyle,
              icon: const Icon(
                Icons.square_outlined,
                size: 14,
              )),
          IconButton(
              onPressed: () {},
              style: buttonStyle,
              icon: const Icon(
                Icons.clear,
                size: 14,
              )),
        ],
      ),
    );
  }
}