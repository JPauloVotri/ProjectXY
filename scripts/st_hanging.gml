if !(hangingUp)
{
    if (keyboard_check_pressed(key.down)) // Precionar pra baixo, ele cai
    {
        state = st_air;
        exit;
    }
    else if (keyboard_check_pressed(key.up)) // Precionar pra cima, ele sobe
    {
        tempY = y;
        tempX = x;
        hangingUp = true;
    }
}
else
{
    if (y > tempY - 160)            // Aqui ele ira subir o personagem até o ponto em que
        yspeed = -m_hangingUpSpd;   // os pés ficarão na altura do bloco
    else
    {
        yspeed = 0;                             // Depois de chegar no ponto, ele vai em
        xspeed = m_hangingUpSpd * hangingDir;   // direção ao bloco
    }
    
    if ((xspeed < 0 && x == tempX - 64) || (xspeed > 0 && x == tempX + 64))
    {
        xspeed = 0;         // Aqui ele para o personagem quando estiver todo em cima
        hangingUp = false;  // do bloco e muda o estado
        state = st_idle;
    }
}
