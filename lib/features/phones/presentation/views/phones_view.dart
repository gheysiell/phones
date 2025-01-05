import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:phones/features/phones/presentation/viewmodels/phones_viewmodel.dart';
import 'package:phones/features/phones_details/presentation/views/phones_details_view.dart';
import 'package:phones/shared/input_styles.dart';
import 'package:phones/shared/palette.dart';
import 'package:phones/shared/widgets/not_found.dart';
import 'package:phones/utils/functions.dart';
import 'package:provider/provider.dart';

class PhonesView extends StatefulWidget {
  const PhonesView({super.key});

  @override
  State<PhonesView> createState() {
    return PhonesViewState();
  }
}

class PhonesViewState extends State<PhonesView> {
  final TextEditingController controllerSearch = TextEditingController();
  final FocusNode focusSearch = FocusNode();
  final ScrollController scrollController = ScrollController();
  final double heightBrandsList = 60;
  late PhonesViewModel phonesViewModel;
  bool initialized = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!initialized) {
      phonesViewModel = context.watch<PhonesViewModel>();

      WidgetsBinding.instance.addPostFrameCallback((_) {
        phonesViewModel.getBrands();
        phonesViewModel.getPhones('', phonesViewModel.indexBrandSelected + 1);
      });

      scrollController.addListener(() {
        unfocusTextSearch();
      });

      initialized = true;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  void unfocusTextSearch() {
    if (focusSearch.hasFocus) focusSearch.unfocus();
    if (phonesViewModel.searchVisible && !phonesViewModel.makingSearch) phonesViewModel.setSearchVisible(false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        unfocusTextSearch();
      },
      child: Scaffold(
        appBar: AppBar(
          title: phonesViewModel.searchVisible
              ? TextFormField(
                  controller: controllerSearch,
                  focusNode: focusSearch,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    filled: true,
                    fillColor: Palette.white,
                    isDense: true,
                    suffixIconConstraints: const BoxConstraints(
                      minHeight: 20,
                      minWidth: 40,
                    ),
                    suffixIcon: phonesViewModel.makingSearch
                        ? IconButton(
                            tooltip: 'Limpar pesquisa',
                            onPressed: () async {
                              controllerSearch.clear();
                              await phonesViewModel.getPhones('', phonesViewModel.indexBrandSelected + 1);
                            },
                            icon: const Icon(
                              Icons.clear_rounded,
                              size: 26,
                              color: Palette.gray,
                            ),
                            visualDensity: VisualDensity.compact,
                          )
                        : null,
                    border: InputStyles.inputBorderSearch,
                    enabledBorder: InputStyles.inputBorderSearch,
                    focusedBorder: InputStyles.inputBorderSearch,
                    disabledBorder: InputStyles.inputBorderSearch,
                  ),
                  onFieldSubmitted: (String value) async {
                    await phonesViewModel.getPhones(controllerSearch.text, phonesViewModel.indexBrandSelected + 1);
                  },
                )
              : const Text(
                  'Phones',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Palette.white,
                  ),
                ),
          leading: Container(
            alignment: Alignment.center,
            width: 55,
            child: Center(
              child: Image.asset(
                'assets/images/icon.png',
                width: 55,
              ),
            ),
          ),
          titleSpacing: 6,
          actions: [
            phonesViewModel.searchVisible
                ? const SizedBox(
                    width: 6,
                  )
                : IconButton(
                    onPressed: () async {
                      phonesViewModel.setSearchVisible(true);
                      focusSearch.requestFocus();
                    },
                    icon: const Icon(
                      Icons.search_rounded,
                      size: 30,
                      color: Palette.white,
                    ),
                    tooltip: 'Pesquisar',
                  ),
          ],
          backgroundColor: Palette.primary,
          elevation: 6,
          shadowColor: Palette.black,
        ),
        backgroundColor: Palette.white,
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: heightBrandsList,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: phonesViewModel.loadingBrands
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : !phonesViewModel.loadingBrands && phonesViewModel.brands.isEmpty
                          ? ElevatedButton(
                              onPressed: () async {
                                await phonesViewModel.getBrands();
                              },
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: EdgeInsets.zero,
                                backgroundColor: Palette.primary,
                              ),
                              child: const Icon(
                                Icons.refresh_rounded,
                                size: 30,
                                color: Palette.white,
                              ),
                            )
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: phonesViewModel.brands.length,
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: phonesViewModel.indexBrandSelected == index
                                        ? Palette.primary
                                        : Palette.secondary,
                                  ),
                                  margin: const EdgeInsets.only(right: 8),
                                  child: TextButton(
                                    onPressed: () async {
                                      phonesViewModel.setIndexBrandSelected(index);
                                      controllerSearch.clear();
                                      await phonesViewModel.getPhones('', phonesViewModel.brands[index].id);
                                    },
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(horizontal: 18),
                                      alignment: Alignment.center,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: Text(
                                      Functions.capitalFirstLetter(phonesViewModel.brands[index].name),
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            phonesViewModel.indexBrandSelected == index ? Palette.white : Palette.gray,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                ),
                Expanded(
                  child: phonesViewModel.loading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : RefreshIndicator(
                          onRefresh: () async {
                            await phonesViewModel.getPhones(
                                controllerSearch.text, phonesViewModel.indexBrandSelected + 1);
                          },
                          child: !phonesViewModel.loading && phonesViewModel.phones.isEmpty
                              ? SingleChildScrollView(
                                  physics: const AlwaysScrollableScrollPhysics(),
                                  child: SizedBox(
                                    height: Functions.getHeightBody(context) - heightBrandsList,
                                    width: double.infinity,
                                    child: const NotFoundWidget(title: 'Telefones não encontrados'),
                                  ),
                                )
                              : ListView.builder(
                                  itemCount: phonesViewModel.phones.length,
                                  padding: const EdgeInsets.symmetric(vertical: 6),
                                  physics: const AlwaysScrollableScrollPhysics(),
                                  controller: scrollController,
                                  itemBuilder: (BuildContext context, int index) {
                                    return ListTile(
                                      leading: SizedBox(
                                        width: 50,
                                        child: TextButton(
                                          onPressed: () {
                                            Functions.showNetworkImageFullScreen(
                                              context,
                                              phonesViewModel.phones[index].imageUrl,
                                            );
                                          },
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.zero,
                                            ),
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl: phonesViewModel.phones[index].imageUrl,
                                            placeholder: (context, url) => const Center(
                                              child: CircularProgressIndicator(
                                                strokeWidth: 3,
                                              ),
                                            ),
                                            errorWidget: (context, url, error) => const Icon(
                                              Icons.phone_android_outlined,
                                              size: 50,
                                              color: Palette.grayLight,
                                            ),
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                        phonesViewModel.phones[index].model,
                                        style: const TextStyle(
                                          color: Palette.gray,
                                          fontSize: 18,
                                        ),
                                      ),
                                      subtitle: Text(
                                        phonesViewModel.phones[index].brand,
                                        style: const TextStyle(
                                          color: Palette.grayMedium,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => PhonesDetailsView(
                                              id: phonesViewModel.phones[index].id,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                        ),
                ),
              ],
            ),
            Positioned(
              top: 60,
              left: 0,
              right: 0,
              child: Container(
                height: 20,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.08),
                      Colors.black.withOpacity(0.02),
                      Colors.transparent,
                    ],
                    stops: const [
                      0.0,
                      0.6,
                      1.0,
                    ],
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
