import 'package:arcon_app/component/colors.dart';
import 'package:arcon_app/component/style.dart';
import 'package:arcon_app/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ValidationScreen extends StatefulWidget {
  const ValidationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ValidationScreen> createState() => _ValidationScreenState();
}

final FocusNode scanFocusNode = FocusNode();
final TextEditingController _controller = TextEditingController();

class _ValidationScreenState extends State<ValidationScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var provider = Provider.of<UserController>(context);
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        automaticallyImplyLeading: false,
        toolbarHeight: 65,
        elevation: 0,
        title: Row(
          children: [
            InkWell(
              onTap: () async => await provider.signOut(context: context),
              child: Container(
                height: 36,
                margin: const EdgeInsets.only(left: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColor.white, width: 2),
                ),
                child: Center(
                  child: Text(
                    'LOGOUT',
                    style: style.copyWith(color: AppColor.white),
                  ),
                ),
              ),
            ),
            Expanded(child: Container()),
            Text(
              'Scan QR',
              style: style.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColor.white,
              ),
            ),
            Expanded(child: Container()),
            const SizedBox(
              width: 50,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width < 800 ? 20 : size.width / 4, vertical: 50),
        child: Column(
          children: [
            Text(
              provider.userName.name,
              style: style.copyWith(
                fontSize: 20,
                color: AppColor.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              style: style.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColor.black,
              ),
              controller: _controller,
              autofocus: true,
              focusNode: scanFocusNode,
              cursorColor: AppColor.black,
              onFieldSubmitted: (value) async => await provider
                  .fetchUser(userID: value, context: context)
                  .then(
                    (va) => _controller.clear(),
                  ),
              decoration: InputDecoration(
                fillColor: AppColor.white,
                filled: true,
                hintText: 'Scan',
                hintStyle: style.copyWith(
                  fontSize: 14,
                  color: AppColor.black.withOpacity(0.4),
                  fontWeight: FontWeight.normal,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 24.0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    width: 1,
                    color: AppColor.primaryColor,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: AppColor.black.withOpacity(0.5),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: AppColor.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
