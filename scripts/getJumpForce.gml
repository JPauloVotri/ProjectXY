/// getJumpForce();

if (inWater)
  return m_jumpForce / m_waterDivider;
  
return m_jumpForce;
