import '/config/all_imports.dart';

class SaveNotificationUseCaseInput {
  final int driverId;
  final String title;
  final String content;
  final String timeSend;

  SaveNotificationUseCaseInput({
    required this.timeSend,
    required this.driverId,
    required this.title,
    required this.content,
  });
}

class SaveNotificationUseCase
    extends BaseUseCase<SaveNotificationUseCaseInput, bool> {
  final SaveNotificationRepository _repository;

  SaveNotificationUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> execute(input) async {
    return await _repository.saveNotification(
      SaveNotificationRequest(
        content: input.content,
        title: input.title,
        driverId: input.driverId,
        timeSend: input.timeSend,
      ),
    );
  }
}
