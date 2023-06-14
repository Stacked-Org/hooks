import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import 'with_stacked_hook_viewmodel.dart';

class WithStackedHookView extends StackedView<WithStackedHookViewModel> {
  const WithStackedHookView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    WithStackedHookViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example with Stacked Hook')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: _HookForm(),
        ),
      ),
    );
  }

  @override
  WithStackedHookViewModel viewModelBuilder(BuildContext context) {
    return WithStackedHookViewModel();
  }
}

class _HookForm extends StackedHookView<WithStackedHookViewModel> {
  @override
  Widget builder(BuildContext context, WithStackedHookViewModel viewModel) {
    final title = useTextEditingController();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('Title: ${viewModel.title}'),
        TextField(controller: title, onChanged: viewModel.updateTitle)
      ],
    );
  }
}
