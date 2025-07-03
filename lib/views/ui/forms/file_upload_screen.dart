import 'package:sikilap/controller/ui/forms/file_upload_controller.dart';
import 'package:sikilap/helpers/theme/app_themes.dart';
import 'package:sikilap/helpers/utils/ui_mixins.dart';
import 'package:sikilap/helpers/utils/utils.dart';
import 'package:sikilap/helpers/widgets/my_breadcrumb.dart';
import 'package:sikilap/helpers/widgets/my_breadcrumb_item.dart';
import 'package:sikilap/helpers/widgets/my_container.dart';
import 'package:sikilap/helpers/widgets/my_list_extension.dart';
import 'package:sikilap/helpers/widgets/my_spacing.dart';
import 'package:sikilap/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:sikilap/helpers/widgets/responsive.dart';
import 'package:sikilap/views/layout/layout.dart';
import 'package:get/get.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class FileUploadScreen extends StatefulWidget {
  const FileUploadScreen({super.key});

  @override
  State<FileUploadScreen> createState() => _FileUploadScreenState();
}

class _FileUploadScreenState extends State<FileUploadScreen> with SingleTickerProviderStateMixin, UIMixin {
  late FileUploadController controller;

  @override
  void initState() {
    controller = FileUploadController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        tag: 'file_upload_controller',
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium("File Upload", fontSize: 18, fontWeight: 600),
                    MyBreadcrumb(
                      children: [MyBreadcrumbItem(name: 'Form'), MyBreadcrumbItem(name: 'File Upload', active: true)],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: MyContainer(
                  paddingAll: 24,
                  child: Column(
                    children: [
                      uploadFile(),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget uploadFile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyContainer.bordered(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          onTap: controller.pickFiles,
          paddingAll: 23,
          child: Center(
            heightFactor: 1.5,
            child: Padding(
              padding: MySpacing.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(LucideIcons.folder_up),
                  MySpacing.height(12),
                  MyContainer(
                    width: 340,
                    alignment: Alignment.center,
                    paddingAll: 0,
                    child: MyText.titleMedium(
                      "Drop files here or click to upload.",
                      fontWeight: 600,
                      muted: true,
                      fontSize: 18,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  MyContainer(
                    alignment: Alignment.center,
                    width: 610,
                    child: MyText.titleMedium(
                      "(This is just a demo dropzone. Selected files are not actually uploaded.)",
                      muted: true,
                      fontWeight: 500,
                      fontSize: 16,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Row(
          children: [
            MyText.labelLarge("Multiple File Select"),
            MySpacing.width(12),
            Switch(
              onChanged: controller.onSelectMultipleFile,
              value: controller.selectMultipleFile,
              activeColor: theme.colorScheme.primary,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ],
        ),
        if (controller.files.isNotEmpty) ...[
          MySpacing.height(16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            children: controller.files
                .mapIndexed((index, file) => MyContainer.bordered(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      paddingAll: 8,
                      child: SizedBox(
                        width: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Stack(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              alignment: Alignment.topRight,
                              children: [
                                MyContainer(
                                  height: 100,
                                  width: 100,
                                  color: contentTheme.onBackground.withAlpha(28),
                                  paddingAll: 0,
                                  child: Icon(LucideIcons.file, size: 20),
                                ),
                                MyContainer.transparent(
                                    onTap: () => controller.removeFile(file), paddingAll: 4, child: Icon(LucideIcons.circle_x, color: contentTheme.danger)),
                              ],
                            ),
                            MySpacing.height(8),
                            MyText.bodyMedium(file.name, fontWeight: 600),
                            MySpacing.height(4),
                            MyText.bodySmall(
                              Utils.getStorageStringFromByte(file.bytes?.length ?? 0),
                              fontWeight: 600,
                            ),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          )
        ],
      ],
    );
  }
}
