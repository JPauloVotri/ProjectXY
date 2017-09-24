//Adiciona gravidade
ySpeed += grav;

//Horizontal
xSign = sign(xSpeed);

repeat(abs(xSpeed)){
    if (!place_meeting(x+xSign, y, oBlock)){
        x += xSign;
    }else if (!place_meeting(x+xSign, y-1, oBlock)){
        x += xSign;
        y--;
    }else{
        xSpeed = 0;
    }
    
    if (!place_meeting(x, y+1, oBlock) && place_meeting(x, y+2, oBlock)){
        y++;
    }
    
    if (place_free(x, y+1) && state = st_idle)
        state = st_air;
}

//Vertical
ySign = sign(ySpeed);

repeat(abs(ySpeed)){
    if (place_free(x,y+ySign)){
        y += ySign;
    }else{
        ySpeed = 0;
    }
}
