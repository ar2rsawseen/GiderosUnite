*************************************************************
 * This script is developed by Arturs Sosins aka ar2rsawseen, http://appcodingeasy.com
 * Feel free to distribute and modify code, but keep reference to its creator
 *
 * Gideros Unite framework provides a way to implement Multiplayer games using Gideros Mobile.
 * It uses LuaSocket to establish socket connections and even create server/client instances.
 * It provides the means of device discovery in Local Area Network, and allows to call methods 
 * of other devices throught network
 *
 * For more information, examples and online documentation visit: 
 * http://appcodingeasy.com/Gideros-Mobile/Gideros-Unite-framework-for-multiplayer-games
**************************************************************

Gideros Unite framework provides a way to implement Multiplayer games using Gideros Mobile. It uses LuaSocket to establish socket connections and even create server/client instances.

It provides the means of device discovery in Local Area Network, and allows to call methods of other devices throught network

You can also download a DrawTogether app's source code created using Gideros Unite framework as example, of how you can use Gideros Unite

This is a standard scenario that can be created using Gideros Unite framework: 
1. Server starts broadcasting or skip to step 5, if all clients know server IP address
2. Client's start listening to servers
3. Client receives broadcast message from server, newServer event is initiated
4. Client autoconnects to server or user manually (by pushing button) connects to specific server
5. Server receives newClient event
6. Server accepts client automatically or user manually (by pushing button) accepts specific client
7. Client receives onAccept event
8. Implement your game logic here, where both clients and server can call methods on all devices or on one specific device in the network
9. When one of the clients becomes unreachable, all clients and server get onClientClose event
10. When server becomes unreachable, all clients get onServerClose event
11. When you are finished, close client or server using close method, which stops all timers, closes all connections and destroys instance


About protocols, it is possible to use tcp, udp or both (by binding some method to tcp, if reliability is needed, and others to udp for faster data processing)
 Package contains Unite.lua and example Gideros application project - DrawTogether app.