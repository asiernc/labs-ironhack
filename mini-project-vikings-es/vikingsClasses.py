import random

# Soldier


class Soldier:
    def __init__(self, health, strength):
        # your code here
        if health:
            self.health = health
        if strength:
            self.strength = strength
        return
    
    def attack(self):
        # your code here
        if self.strength <= 0:
            return
        else:
            return self.strength

    def receiveDamage(self, damage):
        # your code here
        if damage <= 0:
            return
        else:
            self.health -= damage
    

# Viking

class Viking(Soldier):
    def __init__(self, name, health, strength):
        # your code here
        if name and health and strength:
            self.name = name
            self.health = health
            self.strength = strength

    def battleCry(self):
        # your code here
        return "Odin Owns You All!"

    def receiveDamage(self, damage):
        # your code here
        if damage:
            self.health -= damage
            if self.health > 0:
                return f"{self.name} has received {damage} points of damage"
            else:
                return f"{self.name} has died in act of combat"

# Saxon

class Saxon(Soldier):
    def __init__(self, health, strength):
        # your code here
        if health and strength:
            self.health = health
            self.strength = strength

    def receiveDamage(self, damage):
        # your code here
            if damage:
                self.health -= damage
                if self.health > 0:
                    return f"A Saxon has received {damage} points of damage"
                else:
                    return 'A Saxon has died in combat'

# Davicente

class War():
    def __init__(self):
        # your code here
        self.vikingArmy = []
        self.saxonArmy = []

    def addViking(self, viking):
        # your code here
        if viking:
            self.vikingArmy.append(viking)
    
    def addSaxon(self, saxon):
        # your code here
        if saxon:
            self.saxonArmy.append(saxon)
    
    def vikingAttack(self):
        # your code here
        if self.vikingArmy and self.saxonArmy:
            viking = random.choice(self.vikingArmy)
            saxon = random.choice(self.saxonArmy)
            result = saxon.receiveDamage(viking.strength)
            if saxon.health <= 0:
                self.saxonArmy.remove(saxon)
            return result
        else:
            return None
        
    
    def saxonAttack(self):
        # your code here
        if self.vikingArmy and self.saxonArmy:
            viking = random.choice(self.vikingArmy)
            saxon = random.choice(self.saxonArmy)
            result = viking.receiveDamage(saxon.strength)
            if viking.health <= 0:
                self.vikingArmy.remove(viking)
            return result
        else:
            return None

    def showStatus(self):
        # your code here
        if self.vikingArmy and self.saxonArmy:
            return 'Vikings and Saxons are still in the thick of battle.'
        elif self.vikingArmy and not self.saxonArmy:
            return 'Vikings have won the war of the century!'
        elif self.saxonArmy and not self.vikingArmy:
            return 'Saxons have fought for their lives and survive another day...'
        else:
            pass

