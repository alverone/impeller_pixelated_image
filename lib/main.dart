import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const _imageSize = 192.0;

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Text(
                  'Device pixel ratio: '
                  '${MediaQuery.maybeDevicePixelRatioOf(context)}',
                ),
                const SizedBox(height: 24),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        '24x24 png asset with a '
                        'non-trasparent 1 pixel border: ',
                      ),
                    ),
                    SizedBox(width: 16),
                    _ImageWidget(
                      assetName: 'assets/test.png',
                      filterQuality: FilterQuality.none,
                      dimension: _imageSize,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        '24x24 png asset with a transparent 1 pixel border: ',
                      ),
                    ),
                    SizedBox(width: 16),
                    _ImageWidget(
                      assetName: 'assets/test_t.png',
                      filterQuality: FilterQuality.none,
                      dimension: _imageSize,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(child: Text('192x192 png asset: ')),
                    SizedBox(width: 16),
                    _ImageWidget(
                      assetName: 'assets/test_h.png',
                      filterQuality: FilterQuality.low,
                      dimension: _imageSize,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget({
    required this.assetName,
    required this.dimension,
    this.filterQuality = FilterQuality.low,
  });

  final String assetName;
  final FilterQuality filterQuality;
  final double dimension;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetName,
      filterQuality: filterQuality,
      width: dimension,
      height: dimension,
      fit: BoxFit.contain,
    );
  }
}
