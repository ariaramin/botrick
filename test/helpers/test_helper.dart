import 'package:botrick/features/chat/data/datasource/chat_datasource.dart';
import 'package:botrick/features/chat/domain/repository/chat_repository.dart';
import 'package:botrick/features/chat/domain/usecase/send_message.dart';
import 'package:botrick/features/image_generator/data/datasource/image_generator_datasource.dart';
import 'package:botrick/features/image_generator/domain/repository/image_generator_repository.dart';
import 'package:botrick/features/image_generator/domain/usecase/generate_image.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  ChatRepository,
  ImageGeneratorRepository,
  ChatDatasource,
  ImageGeneratorDatasource,
  SendMessage,
  GenerateImage
])
void main() {}
