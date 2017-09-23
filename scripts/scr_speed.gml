if (m_canMoveInAir)
{
    if (place_free(x, y+1) && m_jumpDir != sign(xspeed))
    {
        m_jumpDir = 0;
        return m_airSpd;
    }
}

return m_speed;
