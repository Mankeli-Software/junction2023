import 'dart:async';

import 'package:analytic_repository/analytic_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:auto_route/auto_route.dart' hide DeepLink;
import 'package:cache_repository/cache_repository.dart';
import 'package:cloud_function_repository/cloud_function_repository.dart';
import 'package:database_repository/database_repository.dart';
import 'package:deep_link_repository/deep_link_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mankeli_core/mankeli_core.dart';
import 'package:j_mp/extension/extension.dart';
import 'package:j_mp/main/launch_helper.dart';
import 'package:model/model.dart';
import 'package:notification_repository/notification_repository.dart';
import 'package:permission_repository/permission_repository.dart';
import 'package:storage_repository/storage_repository.dart';

part 'app.gen.dart';
part 'app_cubit.dart';
part 'app_state.dart';
