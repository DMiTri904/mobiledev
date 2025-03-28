


import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

Future<String> uploadImage({
  required File image,
  required String bucket,
  required String path}) async{
  await supabase.storage.from(bucket).upload(
  path,
  image,
  fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
  );
  final String publicUrl = supabase
      .storage
      .from(bucket)
      .getPublicUrl(path);
  return publicUrl;
}

Future<void> deleteImage({required String bucket, required String path}) async{
  await supabase
      .storage
      .from(bucket)
      .remove([path]);
}
