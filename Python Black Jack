#import packages

import random
import pandas as pd

#Establish class for player

class Player:
    def __init__(self, name, starting_money):
        self.name = name
        self.starting_money = starting_money

## Define Functions for Game ##
def player_draw():
  card = random.randint(1,11)
  return(card)

def dealer_draw():
  card = random.randint(1,11)
  return(card)


def initial_draw():
    cards = []
    for i in range(2):
        card = random.randint(1, 11)
        cards.append(card)
    return cards


### Game ###

# Introduction
print("Hello and Welcome to Python Black Jack!")

# Get user input
name = input("First, let's get your name: ")
money = input("How much money would you like to put in? ")
money_int = int(money)

# Create Player object
player = Player(name, money)

# Welcome message
print("Welcome " + player.name + " with $" + player.starting_money)

#Get Number of Games
games = input(player.name + " how many games would you like to play?")

#Game Loop

for game in range(1,int(games) + 1):
  print("\n\n\n")
  print(f"Welcome to game {game}!\n Your objective is to get to 21 before the dealer\n be careful not go over 21 before the dealer!\n\n you currently have "+ f"${money_int}")
  money_bet = int(input("How much money would you like to bet on the game: "))
  player_amount = 0
  dealer_amount = 0
  player_initial_cards = initial_draw()
  dealer_initial_cards = initial_draw()


  #inital draw
  print(player.name + " your cards are: ")
  print(player_initial_cards)
  print("The dealer has one face up card: ")
  print(dealer_initial_cards[1])

  player_amount = player_initial_cards[0] + player_initial_cards[1]
  dealer_amount = dealer_initial_cards[0] + dealer_initial_cards[1]

  if player_amount == 21:
    print(player.name + "You have won 21!")
    money_int += money_bet
  elif player_amount > 21:
    print(player.name + f"You have lost, with {player_amount}!")
    money_int -= money_bet
    money_array.append(money_int)
  elif dealer_amount == 21:
    print("Dealer has won 21!")
    money_int -= money_bet
  elif dealer_amount > 21:
    print(f"Dealer Lost, with {dealer_amount}")
    money_int += money_bet
  elif dealer_amount == player_amount:
    print(f"Tie! Dealer wins, with {dealer_amount}!")
    money_int -= money_bet
  else:


    while player_amount <= 21 and dealer_amount <= 21:
      if player_amount == 21:
        print(player.name + "You have won 21!")
        print(f"End of game {game} and you have ${money_int}")
        break

      elif dealer_amount == 21:
           print("Dealer has won 21!")
           print(f"End of game {game} and you have ${money_int}")
           money_int -= money_bet
           break
      else:

        d = input("Would you like to draw? Answer y or n: ")
    
        if d.lower() == "y":
            player_drawn_card = player_draw()
            player_amount += player_drawn_card
            print(f"{player.name}, you drew a card worth {player_drawn_card}.")
            print(f"You now have {player_amount}.")
        elif d.lower() == "n":
            print(f"{player.name} has chosen to stop drawing.")
        else:
            print("Invalid input. Please enter 'y' or 'n'.")
            continue
    
        if player_amount > 21:
            print(f"{player.name}, you have gone over 21 and lost!")
            money_int -= money_bet
            break

    
    # Determine the outcome and dealer turn
        if player_amount < 21 and dealer_amount > 21:
            print(f"Dealer has gone over 21. {player.name} wins!")
            money_int += money_bet
        elif player_amount < 21 and player_amount > dealer_amount:
            print(f"{player.name} neither of you have won yet, keep trying!.")
            dealer_drawn_card = dealer_draw()
            dealer_amount += dealer_drawn_card
            print(f"Dealer drew a card worth {dealer_drawn_card}.")
        elif dealer_amount < 21 and dealer_amount > player_amount:
            print(f"{player.name} neither of you have won yet, dealer declines to draw keep trying!.")
        elif dealer_amount == 21:
          print("21! Dealer wins!")
          money_int -= money_bet
        elif player_amount == 21:
          print("21! " + f"{player.name} wins!")
          money_int += money_bet
        elif player_amount == dealer_amount:
            print("Tie! Dealer wins!")
            money_int -= money_bet

    # End of the game for this round
    print(f"End of game {game} and you have ${money_int}")
