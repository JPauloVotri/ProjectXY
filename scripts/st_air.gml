if (place_meeting(x, y, obj_water) && !inWater)
{
           m_speed /= m_waterDivider;   // Se estiver na água, é reduzida a velocidade,
            xspeed /= m_waterDivider;   // força de pulo, gravidade e velocidade de
       m_jumpForce /= m_waterDivider;   // subida, além de alterar o valor da variavel
          m_gForce /= m_waterDivider;   // que diz se o personagem está na água ou não
    m_hangingUpSpd /= m_waterDivider;
    inWater = true;
}
else if (!place_meeting(x, y, obj_water) && inWater)
{
           m_speed *= m_waterDivider;   // Reseta os valores das váriáveis quando não
       m_jumpForce *= m_waterDivider;   // está na água
          m_gForce *= m_waterDivider;
    m_hangingUpSpd *= m_waterDivider;
    inWater = false;
}

if (place_free(x, y+1))
    grav = m_gForce;        // Aplica a gravidade se o personagem estiver no ar
else
{
    grav = 0;               // Se não, zera a gravidade e a direção do pulo, muda o
    m_jumpDir = 0;          // estado e encerra o Script
    state = st_idle;
    exit;
}

if (keyboard_check_released(key.jump) && yspeed < 0)
    yspeed /= 2;    // Se soltar a tecla de pulo enquanto sobre, a velocidade é dividida
    
if (m_canMoveInAir)
{
    //m_jumpDir = 0;
    if (keyboard_check(key.right))
    {
        if (m_jumpDir != 1) || (xspeed == 0)
        {                       // Se a tecla de movimento para a direita for
            m_jumpDir = 0;      // pressionada e estiver indo para a esquerda, zera
            xspeed = m_airSpd;  // a direção do pulo, e muda a velocidade no ar
        }
    }
    else if (keyboard_check(key.left))
    {
        if ((m_jumpDir != -1) || (xspeed == 0))
        {
            m_jumpDir = 0;      // Mesma coisa do if acima, porem na direção inversa
            xspeed = -m_airSpd;
        }
    }
}

if (place_meeting(x, y, obj_grab) and !place_meeting(x, y+yspeed, obj_grab) &&
    yspeed > 0 && !place_free(x+dir, y))
{
    repeat (abs(yspeed))
    {
        y++;
        
        if (!place_meeting(x, y, obj_grab))
        {
            hangingDir = dir;
            yspeed = 0;
            grav = 0;
            state = st_hanging;
            exit;
        }
    }
}
