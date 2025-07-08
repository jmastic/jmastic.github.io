---
layout: page
title: My name is Justin Mastic.
permalink: /about/
---

As a software development manager and web developer with over ten years of experience working in agile corporate and startup environments, I understand how to balance the needs of developers, management, and clients.  

In my current role, I manage a software development team consisting of twelve technical professionals. To deliver results I focus on understanding technical and functional specifications, managing and coordinating resources and processes, and keeping the development team on track.  

Experience has taught me that effective IT leaders are not measured by the number of coding tasks completed, but by the effectiveness of their team. I seek to understand each team member’s unique background, strengths, and goals in order to connect them with opportunities to grow.  

My experience encompasses management, web development, single page app development, software development, Scrum, A/B testing, technical customer support, UX design, technical troubleshooting, and implementing API management solutions.  

### Key Accomplishments
* Led the development efforts for multiple applications showcased at CES in 2015 and 2016
* Promoted from a Senior Web Developer to the Manager of TV Apps Development based on demonstrated leadership abilities; oversaw the development of multiple pay-TV apps
* Implemented a new application build system to reduce errors during the application release process
* Increased the conversion rate by over 70% by implementing A/B testing for Beyond Diet, an online health community
* Designed innovative web applications, including an online portal, leaderboards, and a virtual rewards system, for Domino’s Pizza, a chain with approximately 5,000 units
* Participated in Anthony Robbins and the Leadership Dojo leadership development programs to improve my effectiveness and compassion as a leader
* B.S. in Computer Science

### Contact Me

<style>
input[type=text], input[type=email], textarea, select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  font-family: inherit;
}

button[type=submit] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

button[type=submit]:hover {
  background-color: #45a049;
}
</style>

<!-- <form action="https://api.web3forms.com/submit" method="POST">

  <input type="hidden" name="access_key" value="2f0e9f9f-a894-42ae-a33b-16175ce85278">

  <input type="text" name="name" placeholder="your name" required>
  <input type="email" name="email" placeholder="your email" required>
  <textarea name="message" required placeholder="your message"></textarea>

  <button type="submit">Send</button>
</form> -->

<div class="flex items-center min-h-screen bg-gray-50 dark:bg-gray-900">
  <div class="container mx-auto">
    <div class="max-w-md mx-auto my-10 bg-white p-5 rounded-md shadow-sm">
      <div class="m-7">
        <form action="https://api.web3forms.com/submit" method="POST" id="form">
          <input type="hidden" name="access_key" value="2f0e9f9f-a894-42ae-a33b-16175ce85278" />
          <input type="hidden" name="subject" value="New Submission from Web3Forms" />
          <input type="checkbox" name="botcheck" id="" style="display: none;" />
          <div class="mb-6">
            <input type="text" name="name" id="name" placeholder="Your name" required class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-indigo-100 focus:border-indigo-300 dark:bg-gray-700 dark:text-white dark:placeholder-gray-500 dark:border-gray-600 dark:focus:ring-gray-900 dark:focus:border-gray-500" />
          </div>
          <div class="mb-6">
            <input type="email" name="email" id="email" placeholder="Your email" required class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-indigo-100 focus:border-indigo-300 dark:bg-gray-700 dark:text-white dark:placeholder-gray-500 dark:border-gray-600 dark:focus:ring-gray-900 dark:focus:border-gray-500" />
          </div>
          <div class="mb-6">
            <textarea rows="5" name="message" id="message" placeholder="Your message" class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-indigo-100 focus:border-indigo-300 dark:bg-gray-700 dark:text-white dark:placeholder-gray-500 dark:border-gray-600 dark:focus:ring-gray-900 dark:focus:border-gray-500" required></textarea>
          </div>
          <div class="mb-6">
            <button type="submit" class="w-full px-3 py-4 text-white bg-indigo-500 rounded-md focus:bg-indigo-600 focus:outline-none">
              Send Message
            </button>
          </div>
          <p class="text-base text-center text-gray-400" id="result"></p>
        </form>
      </div>
    </div>
  </div>
</div>


<script type="text/javascript">
  const form = document.getElementById("form");
  const result = document.getElementById("result");

  form.addEventListener("submit", function (e) {
    const formData = new FormData(form);
    e.preventDefault();
    var object = {};
    formData.forEach((value, key) => {
      object[key] = value;
    });
    var json = JSON.stringify(object);
    result.innerHTML = "Please wait...";

    fetch("https://api.web3forms.com/submit", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json"
      },
      body: json
    })
      .then(async (response) => {
        let json = await response.json();
        if (response.status == 200) {
          result.innerHTML = json.message;
          result.classList.remove("text-gray-500");
          result.classList.add("text-green-500");
        } else {
          console.log(response);
          result.innerHTML = json.message;
          result.classList.remove("text-gray-500");
          result.classList.add("text-red-500");
        }
      })
      .catch((error) => {
        console.log(error);
        result.innerHTML = "Something went wrong!";
      })
      .then(function () {
        form.reset();
        setTimeout(() => {
          result.style.display = "none";
        }, 5000);
      });
  });
</script>
