import 'package:assets_follow_up/src/domain/entity/company_entity.dart';
import 'package:assets_follow_up/src/domain/repository/company_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

class CompaniesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CompaniesLoadingState extends CompaniesState {}

class CompaniesErrorState extends CompaniesState {
  final String message;
  CompaniesErrorState({required this.message});
}

class CompaniesLoadedState extends CompaniesState {
  final List<CompanyEntity> companies;

  CompaniesLoadedState({required this.companies});
}

@Injectable()
class CompaniesBloc extends Cubit<CompaniesState> {
  final CompanyRepository companyRepository;

  CompaniesBloc({required this.companyRepository})
      : super(CompaniesLoadingState());

  Future<void> onCubitInit() async {
    await getCompanies();
  }

  Future<void> getCompanies() async {
    try {
      final companies = await companyRepository.getCompanies();
      emit(CompaniesLoadedState(companies: companies));
    } catch (e) {
      emit(CompaniesErrorState(message: e.toString()));
    }
  }
}
