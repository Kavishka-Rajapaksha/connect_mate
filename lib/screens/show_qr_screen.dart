import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/header.dart';
import '../widgets/primary_button_wdget.dart';
import '../widgets/primary_text_widget.dart';
import '../theme/theme.dart';

class ShowQRScreen extends StatefulWidget {
  const ShowQRScreen({Key? key}) : super(key: key);

  @override
  _ShowQRScreenState createState() => _ShowQRScreenState();
}

class _ShowQRScreenState extends State<ShowQRScreen> {
  // Controller to capture the name typed by the user
  final TextEditingController _nameController = TextEditingController();

  // Once true, we swap to the "QR generated" UI
  bool _isQRGenerated = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        title: Header(
          name: 'Chanuka',
          onBackPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _isQRGenerated ? _buildQrGeneratedCard() : _buildNameInputCard(),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16.0),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: Center(
                          child:
                              _isQRGenerated
                                  ? Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'lib/assets/images/qr.png',
                                        width: 297,
                                        height: 297,
                                      ),
                                      const SizedBox(height: 16),
                                      SvgPicture.asset(
                                        'lib/assets/icons/lofo_with_name.svg',
                                        width: 100,
                                      ),
                                      const SizedBox(height: 16),
                                    ],
                                  )
                                  : Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'lib/assets/images/before_qr.png',
                                      ),
                                      const SizedBox(height: 16),
                                      const Text(
                                        'Your QR code will be displayed here\nafter generation.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNameInputCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.grey[300],
              child: Image.asset(
                'lib/assets/images/user_img.png',
                width: 48,
                height: 48,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  // Fallback icon if image can't be loaded
                  return Icon(Icons.person, size: 32, color: Colors.grey[600]);
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          PrimaryTextField(
            placeholder: 'Enter your name',
            controller: _nameController,
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          PrimaryButton(
            text: 'Generate QR',
            onPressed: () {
              setState(() {
                _isQRGenerated = true;
              });
            },
            isOutlined: true,
          ),
        ],
      ),
    );
  }

  Widget _buildQrGeneratedCard() {
    final String typedName = _nameController.text.trim();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(10), // Reduced from 10 to 4
      child: Column(
        children: [
          SizedBox(
            height: 100, // Reduced from 127 to 100
            child: Center(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  SizedBox(
                    width: 55,
                    height: 55,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 55,
                          height: 55,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                        ),
                        // Inner purple circle

                        // User image - properly sized and using Image.asset
                        ClipOval(
                          child: SizedBox(
                            width:
                                48, // Slightly smaller than the purple circle
                            height: 48,
                            child: Image.asset(
                              'lib/assets/images/user_img.png',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(
                                  Icons.person,
                                  size: 24,
                                  color: Colors.white,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 48,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 3,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'QR Generated',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 6,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (typedName.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              // Replace direct color with decoration to add border radius
              decoration: BoxDecoration(
                color: Color(0xFFE6F0FA),
                borderRadius: BorderRadius.circular(4), // Add 4px border radius
              ),
              width: double.infinity,
              child: Text(
                'Hi My Name is $typedName',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: Colors.blue),
              ),
            ),
        ],
      ),
    );
  }
}
