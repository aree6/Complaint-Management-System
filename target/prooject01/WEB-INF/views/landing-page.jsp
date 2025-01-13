<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="""en"></html>
<head>
    <meta charset="""UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hostel Complaint System</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap" rel="stylesheet">
    <style>
        :root {
            --background: #0F0817;
            --text-primary: #B347FF;
            --purple-bright: #B347FF;
            --purple-light: #E4CCFF;
            --purple-dark: #2D1645;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Avenir Next', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            font-family: 'Permanent Marker';
            letter-spacing: 6px;
        }

        body {
            background-color: var(--background);
            color: var(--text-primary);
            line-height: 1.5;
        }

        .navbar {
            padding: 1.5rem 2rem;
            background: rgba(15, 8, 23, 0.9);
            backdrop-filter: blur(10px);
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }

        .nav-content {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 1.5rem;
            font-weight: 600;
            background: linear-gradient(to right, #B347FF, #E4CCFF);
            -webkit-background-clip: text;
            background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .nav-links {
            display: flex;
            gap: 2rem;
        }

        .nav-links a {
            color: var(--text-primary);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .nav-links a:hover {
            color: var(--purple-bright);
        }

       

        .hero {
            padding: 3rem 2rem 4rem;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: space-between;
            background: radial-gradient(circle at top right, #2D1645, #0F0817);
        }

        .hero-content {
            max-width: 50%;
            padding-left: 4rem;
            text-align: left;
        }

        .hero-image {
            max-width: 45%;
            height: auto;
            padding-right: 4rem;
        }

        .hero-title {
            font-size: 3.5rem;
            line-height: 1.1;
            margin-bottom: 2rem;
            background: linear-gradient(to right, #B347FF, #E4CCFF);
            -webkit-background-clip: text;
            background-clip: text;
            -webkit-text-fill-color: transparent;
            font-family: 'Permanent Marker';
            letter-spacing: 6px; 
        }

        .hero-subtitle {
            font-size: 1.25rem;
            color: var(--purple-light);
            margin-bottom: 2rem;
            max-width: 500px;
        }

        .feature-section {
            padding: 4rem 2rem;
            background: var(--background);
        }

        .features-grid {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }

        .feature-card {
            background: var(--purple-dark);
            padding: 2rem;
            border-radius: 12px;
            transition: transform 0.3s ease;
        }

        .feature-card:hover {
            transform: translateY(-5px);
        }

        .feature-card h3 {
            color: var(--purple-bright);
            margin-bottom: 1rem;
            font-size: 1.5rem;
        }

        .feature-card p {
            color: var(--purple-light);
        }

        @media (max-width: 768px) {
            .nav-links {
                display: none;
            }

            .hero {
                flex-direction: column;
                padding: 6rem 1rem 3rem;
            }
            
            .hero-content, .hero-image {
                max-width: 100%;
                padding: 0 1rem;
            }

            .hero-title {
                font-size: 3rem;
            }

            .hero {
                padding: 6rem 1rem 3rem;
            }
        }




/* From Uiverse.io by cssbuttons-io */ 
button {
 --glow-color: rgb(217, 176, 255);
 --glow-spread-color: rgba(191, 123, 255, 0.781);
 --enhanced-glow-color: rgb(231, 206, 255);
 --btn-color: rgb(100, 61, 136);
 border: .25em solid var(--glow-color);
 padding: 1em 3em;
 color: var(--glow-color);
 font-size: 15px;
 font-weight: bold;
 background-color: var(--btn-color);
 border-radius: 1em;
 outline: none;
 box-shadow: 0 0 1em .25em var(--glow-color),
        0 0 4em 1em var(--glow-spread-color),
        inset 0 0 .75em .25em var(--glow-color);
 text-shadow: 0 0 .5em var(--glow-color);
 position: relative;
 transition: all 0.3s;
 margin-top: 100px;
 
}

button::after {
 pointer-events: none;
 content: "";
 position: absolute;
 top: 120%;
 left: 0;
 height: 100%;
 width: 100%;
 background-color: var(--glow-spread-color);
 filter: blur(2em);
 opacity: .7;
 transform: perspective(1.5em) rotateX(35deg) scale(1, .6);
}

button:hover {
 color: var(--btn-color);
 background-color: var(--glow-color);
 box-shadow: 0 0 1em .25em var(--glow-color),
        0 0 4em 2em var(--glow-spread-color),
        inset 0 0 .75em .25em var(--glow-color);
}

button:active {
 box-shadow: 0 0 0.6em .25em var(--glow-color),
        0 0 2.5em 2em var(--glow-spread-color),
        inset 0 0 .5em .25em var(--glow-color);
}



	
.wave-text {
  --primary: #E4CCFF;;
  display: inline-block;
  font-size: 3.0rem;
  line-height: 1.1;
            
}

/* Make each letter a separate span */
.wave-text span {
  display: inline-block;
  font-weight: 10;
  line-height: 60px;
  font-size: 3.0rem;
  opacity: 0; /* Initially hidden */
  animation: slideDown 10s ease forwards calc(var(--i) * 10s);
}

/* Keyframes for hover effect */
@keyframes wave {
  30% {
    opacity: 1;
    transform: translateY(3px) translateX(0);
  }
  50% {
    opacity: 1;
    transform: translateY(-3px) translateX(0);
    color: var(--primary);
  }
  100% {
    opacity: 1;
    transform: translateY(0) translateX(0);
  }
}

/* Keyframes for initial appearance */
@keyframes slideDown {
  0% {
    opacity: 0;
    transform: translateY(-20px) translateX(5px);
    filter: blur(5px);
  }
  30% {
    opacity: 1;
    transform: translateY(4px) translateX(0);
    filter: blur(0);
  }
  50% {
    opacity: 1;
    transform: translateY(-3px) translateX(0);
  }
  100% {
    opacity: 1;
    transform: translateY(0) translateX(0);
  }
}

/* Apply animation on page load */
.wave-text span {
  animation: wave 1s ease forwards calc(var(--i) * 0.04s);
  animation-iteration-count: 1; /* Ensure it only runs once */

}

.heading-text {
    position: fixed;
    top: 20px;
    left: 50%;
    transform: translateX(-50%);
    font-family: "Permanent Marker", serif;
    background: linear-gradient(to right, #B347FF, #E4CCFF, #ec0606);
    -webkit-background-clip: text;
    background-clip: text;
    -webkit-text-fill-color: transparent;
    padding: 1rem;
    
    z-index: 1001;
    white-space: nowrap;
    font-size: 3.0rem;
    line-height: 1.1;
    letter-spacing: 6px;
}
    </style>
</head>
<body>
   

    <section class="hero">
        <div class="hero-content">
            <!-- <h1 class="hero-title">Manage complaints, without hassle</h1> -->
            <h1 class="wave-text ">
                <span style="--i:1" >MANAGE</span>
                <span style="--i:2" >COMPLAINTS,</span>
                <span style="--i:3" >WITHOUT</span>
                <span style="--i:4" >HASSLE</span>
                
              </h1>
              
            <!-- <p class="hero-subtitle">Streamline your hostel complaint management process with our intuitive and efficient system.</p> -->
            <button onclick="location.href='${pageContext.request.contextPath}/login'">
                START NOW !
            </button>
        </div>
        <div class="hero-image">
            <img src="https://i.ibb.co/pQ5SDCb/Screenshot-2025-01-01-at-5-47-47-PM.png" 
                 alt="HMS Dashboard" 
                 class="dashboard-preview">
        </div>
    </section>

    <style>
        .hero {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 3rem 2rem 4rem;
        }

        .hero-image {
            max-width: 45%;
            padding-right: 2rem;
        }

        .dashboard-preview {
            width: 100%;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.3);
            transform: perspective(1000px) rotateY(-10deg);
            transition: transform 0.3s ease;
        }

        .dashboard-preview:hover {
            transform: perspective(1000px) rotateY(-5deg);
        }

        @media (max-width: 768px) {
            .hero {
                flex-direction: column;
            }
            
            .hero-image {
                max-width: 90%;
                padding: 2rem 0;
            }
            
            .dashboard-preview {
                transform: none;
            }
        }
    </style>

   
  
    <h1 class="heading-text">
        UTM DAMAGE CONTROL SYSTEM
    </h1>
</body>
</html>