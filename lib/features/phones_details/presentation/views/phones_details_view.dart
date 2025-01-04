import 'package:flutter/material.dart';
import 'package:phones/core/models/title_and_data.dart';
import 'package:phones/features/phones_details/presentation/viewmodels/phones_details_viewmodel.dart';
import 'package:phones/shared/palette.dart';
import 'package:provider/provider.dart';

class PhonesDetailsView extends StatefulWidget {
  final String phoneId;

  const PhonesDetailsView({super.key, required this.phoneId});

  @override
  State<PhonesDetailsView> createState() {
    return PhonesDetailsViewState();
  }
}

class PhonesDetailsViewState extends State<PhonesDetailsView> {
  late PhonesDetailsViewModel phonesDetailsViewModel;
  bool initialized = false;
  List<TitleAndData> titlesAndDatas = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!initialized) {
      phonesDetailsViewModel = context.watch<PhonesDetailsViewModel>();

      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await phonesDetailsViewModel.getPhoneDetails(widget.phoneId);

        // titlesAndDatas = phonesDetailsViewModel.phoneDetails;
      });

      initialized = true;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Phone',
          style: TextStyle(
            color: Palette.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            size: 30,
            color: Palette.white,
          ),
          tooltip: 'Pesquisar',
        ),
        backgroundColor: Palette.primary,
        elevation: 6,
        shadowColor: Palette.black,
      ),
      backgroundColor: Palette.white,
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titlesAndDatas[index].title,
              ),
              Text(
                titlesAndDatas[index].data,
              ),
            ],
          );
        },
      ),
    );
  }
}
