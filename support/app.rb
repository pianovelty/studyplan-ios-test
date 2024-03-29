def colorize(text, color_code)
  "\e[#{color_code}m#{text}\e[0m"
end

def red(text); colorize(text, 31); end
def green(text); colorize(text, 32); end
def yellow(text); colorize(text, 33); end
def blue(text); colorize(text, 34); end
def magenta(text); colorize(text, 35); end
def cyan(text); colorize(text, 36); end
def yellow_background(text); colorize(text, 43); end
def magenta_background(text); colorize(text, 45); end
def exchange_foreground_and_background(text); colorize(text, 7); end
def light_red(text); colorize(text, 91); end

def log(msg)
  puts magenta(msg)
end

def log_error(msg)
	puts light_red(msg)
end

def timer(activity = "")
	start_time = Time.now
	yield
	end_time = Time.now
	wait_time = (end_time - start_time).to_i.to_s
	puts cyan(["Timer:", activity, "lasted for #{wait_time} seconds"].join(" "))
end