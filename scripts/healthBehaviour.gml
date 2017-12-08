/// healthBehaviour();

if (hp > MAXHP){
  if (extraLifesTotal - extraLifes > 0){
    extraLifes++;
    hp -= 100;
  }else
    hp = 99;
}

if (hp < 0){
  if (extraLifes > 0){
    extraLifes--;
    hp += 100;
  }else
    hp = 0;
}
