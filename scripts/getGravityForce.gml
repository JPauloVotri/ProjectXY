/// getGravityForce();

if (inWater)
  return m_gForce / m_waterDivider;
  
return m_gForce;
