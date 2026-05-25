import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger_helper/logger_helper.dart';
import 'package:provider/provider.dart';
import 'package:ui_kit/ui_kit.dart';

import '../notifiers/vacancies_main_page_notifier.dart';
import 'create_vacancy_page.dart';

/// Назначение: экран получения списка вакансий
/// Дата создания: 25.05.2026
/// Создал: Захар
class VacanciesMainPage extends StatefulWidget {
  const VacanciesMainPage({super.key});

  @override
  State<VacanciesMainPage> createState() => _VacanciesMainPageState();
}

class _VacanciesMainPageState extends State<VacanciesMainPage>
    with LoggableState, CustomLogger {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _reload());
  }

  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<VacanciesMainPageNotifier>();
    logBuild();
    return Scaffold(
      backgroundColor: context.palette.background,
      body: ValueListenableBuilder(
        valueListenable: notifier,
        builder: (context, state, _) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: .infinity,
                  decoration: BoxDecoration(
                    color: context.palette.white,
                    border: .all(color: context.palette.stroke, width: 1.r),
                  ),
                  child: Padding(
                    padding: .symmetric(horizontal: 20.w, vertical: 13.h),
                    child: Row(
                      crossAxisAlignment: .center,
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          'Vacancies',
                          style: context.styles.subheaderSemiBold18.copyWith(
                            height: 28 / 20,
                          ),
                        ),
                        SizedBox.square(dimension: 36.r),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: .symmetric(horizontal: 20.w, vertical: 24.h),
                  child: Row(
                    crossAxisAlignment: .center,
                    mainAxisAlignment: .center,
                    spacing: 12.w,
                    children: [
                      Expanded(
                        child: CustomButton(
                          type: .secondary,
                          onPressed: () {},
                          text: 'Configure\nTables',
                        ),
                      ),
                      Expanded(
                        child: CustomButton(
                          type: .primary,
                          onPressed: () {
                            logInfo(
                              operation: 'Navigator',
                              message: 'Переход на экран создания вакансии',
                            );
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => CreateVacancyPage(),
                              ),
                            );
                          },
                          text: '+Create\nVacancy',
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: .only(bottom: 4.h, left: 20.w, right: 20.w),
                  child: Container(
                    width: .infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 12.r,
                          offset: .new(0, 4),
                          color: Colors.black.withValues(alpha: 0.05),
                        ),
                      ],
                      color: context.palette.white,
                      borderRadius: .circular(12.r),
                      border: .all(
                        color: context.palette.background,
                        width: 1.r,
                      ),
                    ),
                    padding: .all(24.r),
                    child: Column(
                      crossAxisAlignment: .stretch,
                      spacing: 24.h,
                      children: [
                        CustomInput(
                          enabled: true,
                          type: .base,
                          controller: _searchController,
                          hint: 'username or email',
                          title: 'Search',
                        ),
                        CustomButton(
                          type: .primary,
                          text: 'Search',
                          onPressed: () async {
                            logInfo(
                              operation: 'onPressed',
                              message: 'Нажата кнопка search',
                            );
                          },
                        ),
                        Row(
                          children: [
                            Text(
                              '12 vacancies found',
                              style: context.styles.bodyMediumRegular16
                                  .copyWith(color: context.palette.stroke),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: .all(20.r),
                  child: Column(
                    spacing: 24.h,
                    children: [
                      Column(
                        spacing: 16.h,
                        children: [
                          if (state case VacanciesMainPageLoading()) ...{
                            CircularProgressIndicator(
                              color: context.palette.disabled,
                            ),
                          },
                          CustomCard(
                            applicants: 'applicant',
                            title: 'title',
                            time: 'experienceRequired',
                            price: 'salaryTo - item.salaryCurrency',
                            position: 'position',
                          ),
                          CustomCard(
                            applicants: 'applicant',
                            title: 'title',
                            time: 'experienceRequired',
                            price: 'salaryTo - item.salaryCurrency',
                            position: 'position',
                          ),
                          CustomCard(
                            applicants: 'applicant',
                            title: 'title',
                            time: 'experienceRequired',
                            price: 'salaryTo - item.salaryCurrency',
                            position: 'position',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _reload() async {}
}
