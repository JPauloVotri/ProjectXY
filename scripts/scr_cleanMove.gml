//Adiciona gravidade
yspeed += grav;

//Horizontal
x_spd = sign(xspeed);

repeat(abs(xspeed)){
    if (!place_meeting(x+x_spd, y, obj_block)){
        x += x_spd;
    }else if (!place_meeting(x+x_spd, y-1, obj_block)){
        x += x_spd;
        y--;
    }else{
        xspeed = 0;
    }
    
    if (!place_meeting(x, y+1, obj_block) && place_meeting(x, y+2, obj_block)){
        y++;
    }
    
    if (place_free(x, y+1) && state = st_idle)
        state = st_air;
}

//Vertical
y_spd = sign(yspeed);

repeat(abs(yspeed)){
    if (place_free(x,y+y_spd)){
        y += y_spd;
    }else{
        yspeed = 0;
    }
}
