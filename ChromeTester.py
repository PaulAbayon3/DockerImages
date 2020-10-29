# Test Script for Google Chrome
# SUMMARY: Import Selenium WebDriver, call the WebDriver, Open the browser
from selenium import webdriver

chromeDriver = "http://selenium.kumpramart:80/wd/hub"
#chromeDriver = r"C:\Users\Poloy\Desktop\Student Mode\Selenium\drivers\chromedriver.exe"
driver = webdriver.Chrome(chromeDriver)
driver.maximize_window
driver.get("https://google.com")


driver.find_element_by_id("inputWrapper").send_keys("speedtest")
# driver.find_element_by_xpath("//*[@id="tsf"]/div[2]/div[1]/div[1]/div/div[2]/input").click()
driver.close
