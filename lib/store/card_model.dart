class CardModel{
  //Clubs-Diamonds-Hearts-Spades
 String kind;
 //2, 3, 4, 5, 6, 7, 8, 9, 10, Jack - 11, Queen - 12, King - 13, Ace - 14.
 int index;
 //card image is visible or not
 bool isOpen;
 CardModel({required this.kind,required this.index,required this.isOpen});

}