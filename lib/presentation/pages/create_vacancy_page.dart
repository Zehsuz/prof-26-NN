import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger_helper/logger_helper.dart';
import 'package:ui_kit/ui_kit.dart';

/// Назначение: экран создания вакансии
/// Дата создания: 25.05.2026
/// Создал: Захар
class CreateVacancyPage extends StatefulWidget {
  const CreateVacancyPage({super.key});

  @override
  State<CreateVacancyPage> createState() => _CreateVacancyPageState();
}

class _CreateVacancyPageState extends State<CreateVacancyPage>
    with LoggableState, CustomLogger {
  int _page = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 80.h,
        child: CustomButton(
          type: .primary,
          text: 'Next',
          onPressed: () async {
            logInfo(operation: 'onPressed', message: 'Нажата кнопка Next');
            setState(() {
              _page += 1;
            });
          },
        ),
      ),
      backgroundColor: context.palette.background,
      body: SingleChildScrollView(
        child: Center(
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
                      Row(
                        spacing: 20.w,
                        children: [
                          SizedBox.square(dimension: 20.r),
                          Text(
                            'Create Vacancy',
                            style: context.styles.subheaderSemiBold18.copyWith(
                              height: 28 / 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20.w, height: 32.h),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: .only(top: 24.h),
                child: Container(
                  height: 38.h,
                  color: context.palette.stroke,
                  child: Text('General Information: Step $_page'),
                ),
              ),
              Padding(
                padding: .symmetric(horizontal: 20.w, vertical: 32.h),
                child: Builder(
                  builder: (context) {
                    if (_page == 1) {
                      return Container(
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
                        padding: .all(20.r),
                        child: Column(
                          crossAxisAlignment: .stretch,
                          spacing: 24.h,
                          children: [
                            CustomInput(
                              enabled: true,
                              type: .base,
                              controller: .new(),
                              hint: 'e.g. Senior UX Designer',
                              title: 'Vacancy Title',
                            ),
                            CustomInput(
                              enabled: true,
                              type: .base,
                              controller: .new(),
                              hint: 'Product & Design',
                              title: 'Department',
                            ),
                            CustomInput(
                              enabled: true,
                              type: .base,
                              controller: .new(),
                              hint: '24.05.2024',
                              title: 'Opening Date ',
                            ),
                            CustomInput(
                              enabled: true,
                              type: .base,
                              controller: .new(),
                              hint: 'Full-time',
                              title: 'Position ',
                            ),
                            CustomInput(
                              enabled: true,
                              type: .base,
                              controller: .new(),
                              hint: '5,000 - 8,000',
                              title: 'Salary Range ',
                            ),
                            CustomInput(
                              enabled: true,
                              type: .base,
                              controller: .new(),
                              hint: '1',
                              title: 'Required Quantity ',
                            ),
                            CustomInput(
                              enabled: true,
                              type: .base,
                              controller: .new(),
                              hint: 'e.g. 5+ years',
                              title: 'Experience',
                            ),
                            CustomInput(
                              enabled: true,
                              type: .base,
                              controller: .new(),
                              hint: 'New York, NY',
                              title: 'City',
                            ),
                          ],
                        ),
                      );
                    } else if (_page == 2) {
                      return Column(
                        crossAxisAlignment: .stretch,
                        spacing: 20.h,
                        children: [
                          CustomInput(
                            enabled: true,
                            type: .base,
                            controller: .new(),
                            hint:
                                'Detail the day-to-day responsibilities and overall mission...',
                            title: 'Description & Responsibilities',
                          ),
                          CustomInput(
                            enabled: true,
                            type: .base,
                            controller: .new(),
                            hint: 'Terms of Employment',
                            title: 'Working hours, location, benefits...',
                          ),
                          CustomInput(
                            enabled: true,
                            type: .base,
                            controller: .new(),
                            hint:
                                'List specific skills, experience, or certifications needed...',
                            title: 'Requirements',
                          ),
                          CustomInput(
                            enabled: true,
                            type: .base,
                            controller: .new(),
                            hint: 'Specific questions to filter expertise...',
                            title: 'Technical Questions',
                          ),
                          CustomInput(
                            enabled: true,
                            type: .base,
                            controller: .new(),
                            hint:
                                'Brief overview of the practical task if applicable...',
                            title: 'Test Task',
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: .stretch,
                        spacing: 20.h,
                        children: [
                          CustomInput(
                            enabled: true,
                            type: .base,
                            controller: .new(),
                            hint: 'Sarah Jenkins',
                            title: 'HR Manager',
                          ),
                          CustomInput(
                            enabled: true,
                            type: .base,
                            controller: .new(),
                            hint: '+1 (415) 888-2930',
                            title: 'Phone Number',
                          ),
                          CustomInput(
                            enabled: true,
                            type: .base,
                            controller: .new(),
                            hint: 's.jenkins@talentengine.corp',
                            title: 'Email Address',
                          ),
                          CustomInput(
                            enabled: true,
                            type: .base,
                            controller: .new(),
                            hint: 'Select department lead',
                            title: 'Responsible Person',
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
