boolean sameColor(Card a, Card b, Card c) {
  if (a == null || b == null || c == null)
    return false;
  return a.getColor().equals(b.getColor()) && b.getColor().equals(c.getColor());
}

boolean sameShape(Card a, Card b, Card c) {
  if (a == null || b == null || c == null)
    return false;
  return a.getShape().equals(b.getShape()) && b.getShape().equals(c.getShape());
}

boolean sameFill(Card a, Card b, Card c) {
  if (a == null || b == null || c == null)
    return false;
  return a.getFill().equals(b.getFill()) && b.getFill().equals(c.getFill());
}

boolean sameCount(Card a, Card b, Card c) {
  if (a == null || b == null || c == null)
    return false;
  return a.getCount().equals(b.getCount()) && b.getCount().equals(c.getCount());
}

boolean diffColor(Card a, Card b, Card c) {
  if (a == null || b == null || c == null)
    return false;
  return !(a.getColor().equals(b.getColor()) || b.getColor().equals(c.getColor()) || a.getColor().equals(c.getColor()));
}

boolean diffShape(Card a, Card b, Card c) {
  if (a == null || b == null || c == null)
    return false;
  return !(a.getShape().equals(b.getShape()) || b.getShape().equals(c.getShape()) || a.getShape().equals(c.getShape()));
}

boolean diffFill(Card a, Card b, Card c) {
  if (a == null || b == null || c == null)
    return false;
  return !(a.getFill().equals(b.getFill()) || b.getFill().equals(c.getFill()) || a.getFill().equals(c.getFill()));
}

boolean diffCount(Card a, Card b, Card c) {
  if (a == null || b == null || c == null)
    return false;
  return !(a.getCount().equals(b.getCount()) || b.getCount().equals(c.getCount()) || a.getCount().equals(c.getCount()));
}  

boolean isSet(Card a, Card b, Card c) {
  return (sameColor(a, b, c) || diffColor(a, b, c)) &&
         (sameShape(a, b, c) || diffShape(a, b, c)) &&
         (sameFill(a, b, c)  || diffFill(a, b, c))  &&
         (sameCount(a, b, c) || diffCount(a, b, c));
}
