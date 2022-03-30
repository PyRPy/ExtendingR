#include <iostream>
#include <string>
#include <vector>
#include <algorithm>

using namespace std;

struct Card {
    int suit, rank; 
    Card();
    Card(int s, int r);
    void print() const;
    bool isGreater (const Card& c2) const;
};

Card::Card () {
  suit = 0;  rank = 0;
}

Card::Card (int s, int r) {
  suit = s;  rank = r;
}

void Card::print () const {
  vector<string> suits (4);
  suits[0] = "Clubs";
  suits[1] = "Diamonds";
  suits[2] = "Hearts";
  suits[3] = "Spades";

  vector<string> ranks (14);
  ranks[1] = "Ace";
  ranks[2] = "2";
  ranks[3] = "3";
  ranks[4] = "4";
  ranks[5] = "5";
  ranks[6] = "6";
  ranks[7] = "7";
  ranks[8] = "8";
  ranks[9] = "9";
  ranks[10] = "10";
  ranks[11] = "Jack";
  ranks[12] = "Queen";
  ranks[13] = "King";

  cout << ranks[rank] << " of " << suits[suit] << endl;
}

vector<Card> buildDeck() {
    vector<Card> deck (52);
    int i = 0;
    for (int suit = 0; suit <=3; suit++) {
        for (int rank = 1; rank <= 13; rank++) {
            deck[i].suit = suit; 
            deck[i].rank = rank;
            i++;
        }
    }
    return deck;
}

void printDeck (const vector<Card>& deck) {
  for (size_t i = 0; i < deck.size(); i++) {
    deck[i].print ();
  }
}

bool equals (const Card& c1, const Card& c2){
    return (c1.rank == c2.rank && c1.suit == c2.suit);
}

bool Card::isGreater (const Card& c2) const {
  // first check the suits
  if (suit > c2.suit) return true;
  if (suit < c2.suit) return false;

  // if the suits are equal, check the ranks
  if (rank > c2.rank) return true;
  if (rank < c2.rank) return false;

  // if the ranks are also equal, return false
  return false;
}

int findSimple (const Card& card, const vector<Card>& deck) {
  for (size_t i = 0; i < deck.size(); i++) {
    if (equals (deck[i], card)) return i;
  }
  return -1;
}

int findBisect(const Card& card, const vector<Card>& deck, 
                int low, int high) {
    cout << low << ", " << high << endl; 
    if (high < low) return -1; 

    int mid = (high + low) / 2; 
    if (equals(deck[mid], card)) return mid; 
    if (deck[mid].isGreater(card)) {
        return findBisect(card, deck, low, mid-1);
    } else {
        return findBisect(card, deck, mid+1, high);
    }
}

int main() {
    vector<Card> deck = buildDeck();
    cout << "check out a deck by 52 index: " << endl;
    cout << "the first card in the deck is: ";
    deck[0].print();
    cout << "print all the cards in the deck: " << endl;
    printDeck(deck);
    Card card(3, 6);
    cout << "find card at index: " << findSimple(card, deck) << endl;
    cout << "find card at index - bisect: " << findBisect(card, deck, 0, 51) << endl;

    // use algorithm 
    // if (std::find(deck.begin(), deck.end(), card) != deck.end()) {
    //     cout << "card is found in the deck!";
    // }

    // vector<Card>::iterator it; 
    // auto it = find(deck.begin(), deck.end(), card);

    return 0;

}
