import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:phones/features/phones_details/domain/entities/phones_details_title_and_info_entity.dart';
import 'package:phones/features/phones_details/presentation/viewmodels/phones_details_viewmodel.dart';
import 'package:phones/shared/palette.dart';
import 'package:phones/shared/widgets/not_found.dart';
import 'package:phones/utils/functions.dart';
import 'package:provider/provider.dart';

class PhonesDetailsView extends StatefulWidget {
  final String id;

  const PhonesDetailsView({super.key, required this.id});

  @override
  State<PhonesDetailsView> createState() {
    return PhonesDetailsViewState();
  }
}

class PhonesDetailsViewState extends State<PhonesDetailsView> {
  late PhonesDetailsViewModel phonesDetailsViewModel;
  bool initialized = false;
  List<TitleAndInfo> titlesAndInfos = [];

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
        await phonesDetailsViewModel.getPhoneDetails(widget.id);

        titlesAndInfos = [
          TitleAndInfo(title: 'Lançamento', info: phonesDetailsViewModel.phoneDetails?.releaseDate ?? ''),
          TitleAndInfo(title: 'Corpo', info: phonesDetailsViewModel.phoneDetails?.body ?? ''),
          TitleAndInfo(title: 'Sistema', info: phonesDetailsViewModel.phoneDetails?.os ?? ''),
          TitleAndInfo(title: 'Armazenamento', info: phonesDetailsViewModel.phoneDetails?.storage ?? ''),
          TitleAndInfo(title: 'Tamanho da tela', info: phonesDetailsViewModel.phoneDetails?.displaySize ?? ''),
          TitleAndInfo(title: 'Resolução da tela', info: phonesDetailsViewModel.phoneDetails?.displayResolution ?? ''),
          TitleAndInfo(title: 'Pixels da câmera', info: phonesDetailsViewModel.phoneDetails?.cameraPixels ?? ''),
          TitleAndInfo(title: 'Pixels do vídeo', info: phonesDetailsViewModel.phoneDetails?.videoPixels ?? ''),
          TitleAndInfo(title: 'RAM', info: phonesDetailsViewModel.phoneDetails?.ram ?? ''),
          TitleAndInfo(title: 'Chip', info: phonesDetailsViewModel.phoneDetails?.chipset ?? ''),
          TitleAndInfo(title: 'Tamanho da bateria', info: phonesDetailsViewModel.phoneDetails?.batterySize ?? ''),
          TitleAndInfo(title: 'Tipo da bateria', info: phonesDetailsViewModel.phoneDetails?.batteryType ?? ''),
          TitleAndInfo(title: 'Popularidade', info: phonesDetailsViewModel.phoneDetails?.popularity ?? ''),
        ];
        phonesDetailsViewModel.phoneDetails?.networkSpecs.forEach((networkSpec) => titlesAndInfos.add(networkSpec));
        phonesDetailsViewModel.phoneDetails?.launchSpecs.forEach((launchSpec) => titlesAndInfos.add(launchSpec));
        phonesDetailsViewModel.phoneDetails?.bodySpecs.forEach((bodySpec) => titlesAndInfos.add(bodySpec));
        phonesDetailsViewModel.phoneDetails?.displaySpecs.forEach((displaySpec) => titlesAndInfos.add(displaySpec));
        phonesDetailsViewModel.phoneDetails?.platformSpecs.forEach((platformSpec) => titlesAndInfos.add(platformSpec));
        phonesDetailsViewModel.phoneDetails?.memorySpecs.forEach((memorySpec) => titlesAndInfos.add(memorySpec));
        phonesDetailsViewModel.phoneDetails?.mainCameraSpecs
            .forEach((mainCameraSpec) => titlesAndInfos.add(mainCameraSpec));
        phonesDetailsViewModel.phoneDetails?.selfCameraSpecs
            .forEach((selfCameraSpec) => titlesAndInfos.add(selfCameraSpec));
        phonesDetailsViewModel.phoneDetails?.soundSpecs.forEach((soundSpec) => titlesAndInfos.add(soundSpec));
        phonesDetailsViewModel.phoneDetails?.commsSpecs.forEach((commsSpec) => titlesAndInfos.add(commsSpec));
        phonesDetailsViewModel.phoneDetails?.featuresSpecs.forEach((featuresSpec) => titlesAndInfos.add(featuresSpec));
        phonesDetailsViewModel.phoneDetails?.batterySpecs.forEach((batterySpec) => titlesAndInfos.add(batterySpec));
        phonesDetailsViewModel.phoneDetails?.miscSpecs.forEach((miscSpec) => titlesAndInfos.add(miscSpec));
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
            fontSize: 20,
            fontWeight: FontWeight.w600,
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
          tooltip: 'Voltar',
        ),
        titleSpacing: 6,
        backgroundColor: Palette.primary,
        elevation: 6,
        shadowColor: Palette.black,
      ),
      backgroundColor: Palette.white,
      body: RefreshIndicator(
        onRefresh: () async {
          phonesDetailsViewModel.getPhoneDetails(widget.id);
        },
        child: phonesDetailsViewModel.phoneDetails == null && !phonesDetailsViewModel.loading
            ? SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: SizedBox(
                  height: Functions.getHeightBody(context),
                  width: double.infinity,
                  child: const NotFoundWidget(title: 'Detalhes do telefone não encontrados'),
                ),
              )
            : phonesDetailsViewModel.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 5,
                    ),
                    itemCount: titlesAndInfos.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      int indexAfterImage = index - 1;

                      return index == 0
                          ? Container(
                              height: 250,
                              margin: const EdgeInsets.only(bottom: 20),
                              child: TextButton(
                                  onPressed: () {
                                    Functions.showNetworkImageFullScreen(
                                        context, phonesDetailsViewModel.phoneDetails!.imageUrl);
                                  },
                                  style: TextButton.styleFrom(
                                    alignment: Alignment.center,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: phonesDetailsViewModel.phoneDetails!.imageUrl,
                                    placeholder: (context, string) => const Center(
                                      child: CircularProgressIndicator(
                                        strokeWidth: 3,
                                      ),
                                    ),
                                    errorWidget: (context, string, object) => const Icon(
                                      Icons.phone_android_outlined,
                                      size: 50,
                                      color: Palette.grayLight,
                                    ),
                                  )),
                            )
                          : Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    color: Functions.isPair(indexAfterImage) ? Palette.creamy : Palette.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft,
                                        padding: const EdgeInsets.symmetric(vertical: 6),
                                        width: ((MediaQuery.of(context).size.width - 20) * 40) / 100,
                                        child: Text(
                                          titlesAndInfos[indexAfterImage].title,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                            color: Palette.gray,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        padding: const EdgeInsets.symmetric(vertical: 6),
                                        width: ((MediaQuery.of(context).size.width - 30) * 60) / 100,
                                        child: Text(
                                          titlesAndInfos[indexAfterImage].info,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Palette.gray,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                    },
                  ),
      ),
    );
  }
}
