
# clear workspace
rm(list=ls());


#### Reading the TS and plotting it

### KINGS
# load time series
kings = scan("~/code/stocks/learning_ts_R/data//kings.dat.txt");
kings
# convert to time series object
kings_ts = ts(kings);
plot(kings_ts);

### number of births per month in New York city, from January 1946 to December 1959
births = scan("http://robjhyndman.com/tsdldata/data/nybirths.dat");
births_ts = ts(births, frequency=12, start=c(1946, 1));
plot(births_ts);

### Fancy
souvenir = scan("http://robjhyndman.com/tsdldata/data/fancy.dat");
souvenir_ts <- ts(souvenir, frequency=12, start=c(1987,1))
plot(souvenir_ts);

#### Decomposing TS = trend + irregular + seasonal
library('TTR');
library('lattice');
library('xts');
library('quantmod');

# find Moving Average with n = 3
kings_ts_sma3 = SMA(kings_ts, n = 3);

# plot it together
kings.df = data.frame("date" = 1:length(kings), "kings" = kings_ts, "sma3" = kings_ts_sma3);
xyplot(kings + sma3 ~ date, data = kings.df, type="l", main="King`s Age");

# plot with xts
kings_xts = as.xts(kings_ts);
plot.xts(kings_xts, main="King`s Age");
