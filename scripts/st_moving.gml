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
{
    m_jumpDir = sign(xspeed);   // Se o personagem não estiver em cima de nada sólido,
    state = st_air;             // é guardada a direçao na qual o jogador estava andando,
    exit;                       // o estado é mudado e o script é encerrado
}

if (keyboard_check(key.right))
    xspeed = m_speed;               // Move o personagem dependendo da tecla de direção
else if (keyboard_check(key.left))  // precionada
    xspeed = -m_speed;
else
{
    state = st_idle;                // Se nenhuma tecla de direção for precionada, muda
    exit;                           // o estado e encerra o script
}

if (keyboard_check_pressed(key.jump) && !place_free(x,y+1))
{
    yspeed = -m_jumpForce;      // Se a tecla de pulo for precionada e o personagem
    m_jumpDir = sign(xspeed);   // estiver no chao, pula, guarda a direção atual, muda o
    state = st_air;             // estado e encerra o script
    exit;
}
