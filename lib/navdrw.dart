import 'package:arc_clone/provider/bookmarks.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Navdrw extends StatelessWidget {
  Navdrw({Key? key}) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
        backgroundColor: Colors.transparent,
        elevation: 0,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 20.0,
              child: Row(
                children: [
                  TopLeftButton(
                      onPressed: () {},
                      icon: Icons.home_outlined,
                      color: Colors.white),
                  const Spacer(),
                  // IconButton(
                  //     onPressed: () {}, icon: const Icon(Icons.arrow_back)),
                  // IconButton(
                  //     onPressed: () {},
                  //     icon: const Icon(Icons.arrow_forward)),
                  // IconButton(
                  //     onPressed: () {},
                  //     icon: const Icon(Icons.refresh_rounded)),
                  TopLeftButton(
                      onPressed: () {},
                      icon: Icons.arrow_back,
                      color: Colors.white),
                  TopLeftButton(
                      onPressed: () {},
                      icon: Icons.arrow_forward,
                      color: Colors.white),
                  TopLeftButton(
                      onPressed: () {},
                      icon: Icons.refresh_rounded,
                      color: Colors.white),
                ],
              ),
            ),
          ),
          // a text field with a search icon
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white12,
                hintText: 'Search or type URL',
                hintStyle: const TextStyle(color: Colors.white70, fontSize: 14),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              controller: controller,
              onSubmitted: (value) {
                context.read<BookmarksProvider>().addBookmark(value);
                // clear the text field
                controller.clear();
              },
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 20.0,
              child: Row(
                children: [
                  TopLeftButton(
                      onPressed: () {},
                      icon: Icons.archive_rounded,
                      color: Colors.white),
                  const Spacer(),
                  TopLeftButton(
                      onPressed: () {}, icon: Icons.add, color: Colors.white),
                ],
              ),
            ),
          ),
          Consumer<BookmarksProvider>(
            builder: (context, value, child) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: value.bookmarks.length,
                  itemBuilder: (context, index) {
                    return LinkTile(
                      index: index,
                      title: value.bookmarks[index],
                      onTap: () {},
                    );
                  }),
            ),
          ),
        ]);
  }
}

class LinkTile extends StatelessWidget {
  const LinkTile({
    super.key,
    required this.index,
    required this.title,
    required this.onTap,
  });

  final int index;
  final String title;
  final void Function()? onTap;

  String processLink(String tit) {
    var titled = tit.replaceAll('www.', '');
    titled = titled.replaceAll('.com', '');
    titled = titled.replaceAll('.net', '');
    titled = titled.replaceAll('https://', '');
    titled = titled.replaceAll('http://', '');
    titled = titled.replaceAll('web.', '');
    titled = toSentenceCase(titled);
    titled = titled.trimLeft();
    titled = titled.trimRight();
    return titled;
  }

  String toSentenceCase(String input) {
    if (input.isEmpty) return input;
    return input.replaceFirst(RegExp(r'^[^\s]+'),
            input.characters.first.toUpperCase().toString()) +
        input.substring(1).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      leading: const Icon(
        Icons.link,
        color: Colors.white70,
        size: 16,
      ),
      trailing: HoverableWidget(
          child: ElevatedButton(
        style: const ButtonStyle(
            elevation: MaterialStatePropertyAll(0),
            surfaceTintColor: MaterialStatePropertyAll(Colors.transparent),
            backgroundColor: MaterialStatePropertyAll(Colors.transparent),
            iconColor: MaterialStatePropertyAll(Colors.white54),
            minimumSize: MaterialStatePropertyAll(Size(16, 16))),
        child: const Icon(
          Icons.close,
          color: Colors.white54,
        ),
        onPressed: () {
          context.read<BookmarksProvider>().removeBookmark(title);
        },
      )),
      focusColor: Colors.white70,
      title: Text(processLink(title)),
      titleTextStyle: const TextStyle(color: Colors.white),
      onTap: onTap,
    );
  }
}

class TopLeftButton extends StatelessWidget {
  const TopLeftButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.color,
  });

  final void Function()? onPressed;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
          elevation: const MaterialStatePropertyAll(0),
          foregroundColor: const MaterialStatePropertyAll(Colors.white),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide.none,
          )),
          minimumSize: const MaterialStatePropertyAll(Size(26.0, 26.0)),
          padding: const MaterialStatePropertyAll(EdgeInsets.all(6)),
        ),
        onPressed: onPressed,
        child: Center(
          child: Icon(
            icon,
            color: color,
            size: 16.0,
          ),
        ));
  }
}

class HoverableWidget extends StatefulWidget {
  final Widget child;

  const HoverableWidget({required this.child});

  @override
  _HoverableWidgetState createState() => _HoverableWidgetState();
}

class _HoverableWidgetState extends State<HoverableWidget> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.0,
      width: 24.0,
      child: MouseRegion(
        onHover: (_) => setState(() => isHovering = true),
        onExit: (_) => setState(() => isHovering = false),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeOut,
          child: isHovering ? widget.child : Container(),
        ),
      ),
    );
  }
}
