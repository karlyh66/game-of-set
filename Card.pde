// Really important to remember that column and row for the
// card class refers to the column and row in the sprite sheet
public class Card {
  private int colInSpriteSheet;
  private int rowInSpriteSheet;
  private CardColor colour;
  private CardCount count;
  private CardFill fill;
  private CardShape shape;
  
  public Card(int colInSpriteSheet, int rowInSpriteSheet) {
    this.colInSpriteSheet = colInSpriteSheet;
    this.rowInSpriteSheet = rowInSpriteSheet;
    setProperties(colInSpriteSheet,rowInSpriteSheet);
  }
  
  public void setProperties(int col, int row) {
    colour = getColorFromCol(col); 
    count = getCountFromRow(row);
    fill = getFillFromRow(row); 
    shape = getShapeFromCol(col);
  }
  
  // CardColor, CardCount, CardFill, and CardShape are all enumerated types;
  // the enum statements can be found near the top of the SET_Final tab
  public CardColor getColor() { return colour; }
  public CardCount getCount() { return count; }
  public CardFill getFill() { return fill; }
  public CardShape getShape() { return shape; }
  
  // These methods not meant to be visible outside of Card class
  private int getColInSpriteSheet() { return colInSpriteSheet; }
  private int getRowInSpriteSheet() { return rowInSpriteSheet; }
    
  // Use the sprite sheet to see relationships between columns/rows and colours/counts/fills/shapes
  // Sprite sheet at https://amiealbrecht.files.wordpress.com/2016/08/set-cards.jpg
  public CardColor getColorFromCol(int col) { 
    switch(col/3) {
      case 0: return CardColor.GREEN;
      case 1: return CardColor.PURPLE;
      case 2:
      default: return CardColor.RED;
    }
  }
  private CardCount getCountFromRow(int row) { 
    switch(row%3) {
      case 0: return CardCount.ONE;
      case 1: return CardCount.TWO; 
      case 2:
      default: return CardCount.THREE;  
    }
  } 
  public CardFill getFillFromRow(int row) { 
    switch(row/3) {
      case 0: return CardFill.SOLID;
      case 1: return CardFill.STRIPED; 
      case 2: 
      default: return CardFill.OPEN;  
    }
  }
  public CardShape getShapeFromCol(int col) { 
    switch(col%3) {
      case 0: return CardShape.DIAMOND;
      case 1: return CardShape.CAPSULE; 
      case 2:
      default: return CardShape.SQUIGGLY;  
    }
  }
  
  public boolean sameColor(Card other) {
    return getColor().equals(other.getColor());
  }

  public boolean sameCount(Card other) {
    return getCount().equals(other.getCount());
  }

  public boolean sameFill(Card other) {
    return getFill().equals(other.getFill());
  }

  public boolean sameShape(Card other) {
    return getShape().equals(other.getShape());
  }

  public void display(int boardCol, int boardRow) {
    if (state == State.PAUSED) {
      fill(#FF8800);
      rect(GRID_LEFT_OFFSET+boardCol*(CARD_WIDTH+GRID_X_SPACER), 
                GRID_TOP_OFFSET+boardRow*(CARD_HEIGHT+GRID_Y_SPACER),
                CARD_WIDTH, 
                CARD_HEIGHT);
    } else {
      image(cimg, GRID_LEFT_OFFSET+boardCol*(CARD_WIDTH+GRID_X_SPACER), 
                  GRID_TOP_OFFSET+boardRow*(CARD_HEIGHT+GRID_Y_SPACER),
                  CARD_WIDTH, 
                  CARD_HEIGHT,
                  LEFT_OFFSET + getColInSpriteSheet()*CARD_WIDTH, 
                  TOP_OFFSET + getRowInSpriteSheet()*CARD_HEIGHT, 
                  (getColInSpriteSheet()+1)*CARD_WIDTH+CARD_X_SPACER, 
                  (getRowInSpriteSheet()+1)*CARD_HEIGHT+CARD_Y_SPACER);
    }
  }
  
  public boolean equals(Card other) {
    return (getColInSpriteSheet() == other.getColInSpriteSheet() && 
            getRowInSpriteSheet() == other.getRowInSpriteSheet());
  }
  
  public String toString() {
    String str = "{";
    switch (getCount()) {
      case ONE: str += "One "; break;
      case TWO: str += "Two "; break;
      case THREE: 
      default: str += "Three "; break;
    }
    switch (getColor()) {
      case GREEN: str += "green, "; break;
      case PURPLE: str += "purple, "; break;
      case RED: 
      default: str += "red, "; break;
    }
    switch (getFill()) {
      case SOLID: str += "solid "; break;
      case STRIPED: str += "striped "; break;
      case OPEN: 
      default: str += "open "; break;
    }
    switch (getShape()) {
      case DIAMOND: str += (getCount() == CardCount.ONE) ? "diamond" : "diamonds"; break;
      case SQUIGGLY: str += (getCount() == CardCount.ONE) ? "squiggly" : "squigglies"; break;
      case CAPSULE: 
      default: str += (getCount() == CardCount.ONE) ? "capsule" : "capsules"; break;
    }
    str += "}";
    
    return str;
  }
}