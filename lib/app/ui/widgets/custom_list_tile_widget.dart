import 'package:flutter/material.dart';

class CustomListTileWidget extends StatelessWidget {
  final Widget leading;
  final String title;
  final String subtitle;
  final Widget trailing;

  const CustomListTileWidget({
    Key key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _leadingMargin = 16.0;
    const _tilePadding = 10.0;

    return Padding(
      padding: const EdgeInsets.only(
        top: _tilePadding,
        bottom: _tilePadding,
        right: _tilePadding,
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: _leadingMargin),
            child: this.leading,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 13),
                ),
                Text(
                  this.subtitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
          this.trailing
        ],
      ),
    );
  }
}
