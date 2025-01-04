import 'package:phones/features/brands/data/datasources/remote/brands_datasource_remote_http.dart';
import 'package:phones/features/brands/data/repositories/brands_repository_impl.dart';
import 'package:phones/features/brands/domain/usecases/brands_usecase.dart';
import 'package:phones/features/phones/data/datasources/remote/phones_datasource_remote_http.dart';
import 'package:phones/features/phones/data/repositories/phones_repository_impl.dart';
import 'package:phones/features/phones/domain/usecases/phones_usecase.dart';
import 'package:phones/features/phones/presentation/viewmodels/phones_viewmodel.dart';
import 'package:phones/features/phones_details/data/datasources/remote/phones_details_datasource_remote_http.dart';
import 'package:phones/features/phones_details/data/repositories/phones_details_repository_impl.dart';
import 'package:phones/features/phones_details/domain/usecases/phones_details_usecase.dart';
import 'package:phones/features/phones_details/presentation/viewmodels/phones_details_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  Provider(
    create: (context) => PhonesDataSourceRemoteHttpImpl(),
  ),
  Provider(
    create: (context) => PhonesRepositoryImpl(
      phonesDataSourceRemoteHttp: context.read<PhonesDataSourceRemoteHttpImpl>(),
    ),
  ),
  Provider(
    create: (context) => PhonesUseCase(
      phonesRepository: context.read<PhonesRepositoryImpl>(),
    ),
  ),
  Provider(
    create: (context) => BrandsDataSourceRemoteHttpImpl(),
  ),
  Provider(
    create: (context) => BrandsRepositoryImpl(
      brandsDataSourceRemoteHttp: context.read<BrandsDataSourceRemoteHttpImpl>(),
    ),
  ),
  Provider(
    create: (context) => BrandsUseCase(
      brandsRepository: context.read<BrandsRepositoryImpl>(),
    ),
  ),
  ChangeNotifierProvider(
    create: (context) => PhonesViewModel(
      phonesUseCase: context.read<PhonesUseCase>(),
      brandsUseCase: context.read<BrandsUseCase>(),
    ),
  ),
  Provider(
    create: (context) => PhonesDetailsDataSourceRemoteHttpImpl(),
  ),
  Provider(
    create: (context) => PhonesDetailsRepositoryImpl(
      phonesDetailsDataSourceRemoteHttp: context.read<PhonesDetailsDataSourceRemoteHttpImpl>(),
    ),
  ),
  Provider(
    create: (context) => PhonesDetailsUseCase(
      phonesDetailsRepository: context.read<PhonesDetailsRepositoryImpl>(),
    ),
  ),
  ChangeNotifierProvider(
    create: (context) => PhonesDetailsViewModel(
      phonesDetailsUseCase: context.read<PhonesDetailsUseCase>(),
    ),
  ),
];
