
https://github.com/elastic/elasticsearch/issues/39946


renweizhukov commented on Sep 21, 2019
After some debugging and configuration tuning, I found that the exception was caused by too many concurrent ElasticSearch clients. After I reduce the number of concurrent clients, the exception is gone.

pavalanski commented on Sep 24, 2019
@renweizhukov thanks for the hint! I'm using the client at scheduled method, so every invocation is started in new thread. The client has been injected to the service and never closed. Seems that is the reason of exception in my case. I changed my implementation so a new client is created at every thread when it is needed and closes in the end of method. That fixed the issue.
