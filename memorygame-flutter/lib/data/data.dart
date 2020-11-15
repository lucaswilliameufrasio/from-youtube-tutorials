import 'package:memorygame/model/tile_model.dart';

int points = 0;
bool selected = false;
String selectedImage = "";
int selectedTileIndex;

List<TileModel> pairs = new List<TileModel>();
List<TileModel> visiblePairs = new List<TileModel>();

List<TileModel> getPairs() {
  List<TileModel> pairs = new List<TileModel>();

  TileModel tileModel = new TileModel();

  tileModel.setImageAssetPath("assets/fox.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  tileModel.setImageAssetPath("assets/hippo.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  tileModel.setImageAssetPath("assets/horse.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  tileModel.setImageAssetPath("assets/monkey.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  tileModel.setImageAssetPath("assets/panda.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  tileModel.setImageAssetPath("assets/parrot.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  tileModel.setImageAssetPath("assets/rabbit.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  tileModel.setImageAssetPath("assets/elefant.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  return pairs;
}

List<TileModel> getQuestions() {
  List<TileModel> questions = new List<TileModel>();

  TileModel tileModel = new TileModel();

  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  questions.add(tileModel);
  questions.add(tileModel);

  tileModel = new TileModel();

  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  questions.add(tileModel);
  questions.add(tileModel);

  tileModel = new TileModel();

  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  questions.add(tileModel);
  questions.add(tileModel);

  tileModel = new TileModel();

  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  questions.add(tileModel);
  questions.add(tileModel);

  tileModel = new TileModel();

  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  questions.add(tileModel);
  questions.add(tileModel);

  tileModel = new TileModel();

  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  questions.add(tileModel);
  questions.add(tileModel);

  tileModel = new TileModel();

  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  questions.add(tileModel);
  questions.add(tileModel);

  tileModel = new TileModel();

  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  questions.add(tileModel);
  questions.add(tileModel);

  tileModel = new TileModel();

  return questions;
}
