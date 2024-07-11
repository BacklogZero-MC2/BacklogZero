"use client"

import './globals.css';

import Image from 'next/image';
import Logo from '@/assets/logo.png';

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { useState } from 'react';

const page = () => {
  let iconSee = <FontAwesomeIcon icon="fa-solid fa-eye" className='toggleButton' size='lg'/>;
  let iconUnSee = <FontAwesomeIcon icon="fa-solid fa-eye-slash" className='toggleButton' size='lg'/>;
  let icon;

  const [invis, setInvis] = useState(true);
  if (invis) {
    icon = iconUnSee;
  } else {
    icon = iconSee;
  }

  return (
    <div className='logInMain'>
      <Image src={Logo} height={50} width={50} />
      <h1>Log in</h1>
      <p className='introP'>Log In To Access Your Personalized Learning Journey</p>

      <div className='formBox'>
          <form action="http://localhost:3000/feed">
            <label for="logInEmail" class="logInEmailLabel">Email or username</label>
            <input type="email" name="logInEmail" id="logInEmail" placeholder='youremail@tvz.hr' class="logInEmailField"></input>

            <label for="logInPassword" class="logInPasswordLabel">Password</label>
            <div id='pbox'>
            <input type="password" name="logInPassword" id="logInPassword" placeholder='*************************' class="logInPasswordField"></input>
            </div>
            <button className='visibilityToggleButton'>{icon}</button>
            

            <p className='logInFPp'><a href='#' className='logInFP'>Forgot password?</a></p>
            <p className='logInNTBp'><a href='#' className='logInNTB'>New to Backlog0? <span>Sign Up here</span></a></p>



            <input type="submit" value="LOG IN" name="logInLOGIN" id="logInLOGIN" class="logInLOGINField" onClick={() => {}}></input>
          </form>

        </div>
    </div>
  )
}

export default page