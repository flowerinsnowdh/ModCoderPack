package MCP.mod_mcp;

import java.util.Random;

import org.lwjgl.input.Keyboard;

import MCP.ApiController;
import MCP.ApiCraftMgr;
import MCP.Mod;
import net.minecraft.src.Block;
import net.minecraft.src.Chunk;
import net.minecraft.src.Entity;
import net.minecraft.src.EntityChicken;
import net.minecraft.src.EntityPlayer;
import net.minecraft.src.GuiScreen;
import net.minecraft.src.Item;
import net.minecraft.src.ItemStack;
import net.minecraft.src.Material;
import net.minecraft.src.World;
import net.minecraft.src.WorldGenMinable;

public class mod_mcp extends Mod
{
	private long tickCounter;
	private BlockItemSilverOre silverOre;
	private ItemSilver silver;
	private ItemScepter scepter;
	private BlockConstantinum constantinum;
	
	/**********************************************************************
	 * 
	 */
	public mod_mcp(ApiController ctrl)
	{
		super(ctrl);
	}
	
	/**********************************************************************
	 * 
	 */
	@Override
	public String getModName()
	{
		return "MCP Test Mod";
	}

	/**********************************************************************
	 * 
	 */
	@Override
	public String getModAuthor()
	{
		return "Searge";
	}

	/**********************************************************************
	 * 
	 */
	@Override
	public String getModDescription()
	{
		String desc = "Add a recipe to create string from cloth.";
		desc += "\nUsing the mod system recipe manager.";
		return desc;
	}

	/**********************************************************************
	 * 
	 */
	@Override
	public String getModVersion()
	{
		return "1.0";
	}
	
	/**********************************************************************
	 * 
	 */
	@Override
	public String getModSystemVersion()
	{
		return "1.2";
	}
	
	/**********************************************************************
	 * 
	 */
	@Override
	public String getMinecraftVersion()
	{
		return "1.3_01";
	}
	
	/**********************************************************************
	 * 
	 */
	@Override
	public void onMinecraftStarted()
	{
	}

	/**********************************************************************
	 * 
	 */
	@Override
	public void onMinecraftEnding()
	{
	}

	/**********************************************************************
	 * 
	 */
	@Override
	public void onGameStarted()
	{
		this.tickCounter = 1;
	}

	/**********************************************************************
	 * 
	 */
	@Override
	public void onGameEnding()
	{
		this.tickCounter = 0;
	}
	
	/**********************************************************************
	 * 
	 */
	@Override
	public void onTick()
	{
		if(this.tickCounter > 0)
			++this.tickCounter;

		if(this.tickCounter == 10)
			api().printc("\2477Press 't' to open the console and enter /help for more info");
		
		if(this.tickCounter == 90)
		{
			api().printc("\247cSearge\247e mod system v1.0");
			api().printc("\247aWelcome to \247cmod_mcp\247a. \247eHave fun.");
		}
	}

	/**********************************************************************
	 * 
	 */
	@Override
	public void onRegisterBlocksAndItems()
	{
		int silverIcon = api().registerItemIcon(imageName(getClass(), "gfx/mcp.png"), 0);
		int silverTexture = api().registerBlockTexture(imageName(getClass(), "gfx/mcp.png"), 1);
		int scepterIcon = api().registerItemIcon(imageName(getClass(), "gfx/mcp.png"), 2);
		
		this.silverOre = new BlockItemSilverOre(api(), silverTexture, Material.iron, BlockSilverOre.class);
		this.silver = new ItemSilver(api(), silverIcon);
		this.scepter = new ItemScepter(api(), scepterIcon);
		this.constantinum = new BlockConstantinum(api(), 0, Material.rock);
	}

	/**********************************************************************
	 * 
	 */
	@Override
	public void onRegisterRecipes(ApiCraftMgr craftMgr)
	{
        craftMgr.addShapelessRecipe(new ItemStack(Item.silk, 4), new Object[] {
            Block.cloth
        });

        craftMgr.addFurnaceRecipe(this.silverOre, new ItemStack(this.silver));
        
        craftMgr.addRecipe(new ItemStack(this.scepter), new Object[] {
            "  #", " / ", "/  ", Character.valueOf('#'), Item.diamond, Character.valueOf('/'), this.silver
        });
        
        //*DEBUG:
        craftMgr.addRecipe(new ItemStack(this.silverOre, 4), new Object[] {
            "# #", " # ", "# #", Character.valueOf('#'), Item.diamond
        });
        
        craftMgr.addRecipe(new ItemStack(Item.diamond, 8), new Object[] {
            " #", "# ", Character.valueOf('#'), Block.sand
        });
        
        craftMgr.addRecipe(new ItemStack(Item.flintAndSteel, 1), new Object[] {
            " #", "# ", Character.valueOf('#'), Block.dirt
        });
        
        craftMgr.addRecipe(new ItemStack(Block.obsidian, 10), new Object[] {
            "##", " #", Character.valueOf('#'), Block.sand
        });
        
        craftMgr.addRecipe(new ItemStack(this.constantinum, 8), new Object[] {
            "##", " #", Character.valueOf('#'), Block.dirt
        });
        //*/
	}
	
	/**********************************************************************
	 * 
	 */
	@Override
	public boolean onConsoleCommand(String command, String param)
	{
		if(command.equals("help"))
		{
			api().printc("Try /hello or /give [ID] [AMOUNT]");
			return true;
		}
		if(command.equals("hello"))
		{
			api().printc("Hello " + api().mc().session.username);
			return true;
		}
		if(command.equals("give"))
		{
			String[] parms = param.split(" ");
			if(parms.length > 0)
			{
				try
				{
					int id = Integer.parseInt(parms[0]);
					int amount = 1;
					int damage = 0;
					
					if(parms.length > 1)
						amount = Integer.parseInt(parms[1]);

					if(parms.length > 2)
						damage = Integer.parseInt(parms[2]);
					
					ItemStack items = new ItemStack(id, amount, damage);
					api().mc().thePlayer.inventory.addItemStackToInventory(items);
				}
				catch(Exception e)
				{
				}
			}
			return true;
		}
		
		return false;
	}

	/**********************************************************************
	 * 
	 */
	@Override
	public boolean onKeyPress(int keycode, boolean pressed)
	{
		if(pressed)
		{
			switch(keycode)
			{
				case Keyboard.KEY_HOME:
					api().mc().theWorld.setWorldTime(0);
					return true;
				case Keyboard.KEY_END:
					api().mc().theWorld.setWorldTime(12000);
					return true;
			}
		}
		return false;
	}

	/**********************************************************************
	 * 
	 */
	@Override
	public int onAddFuel(int itemID)
	{
		if(itemID == Block.cloth.blockID)
			return 1000;
		if(itemID == Item.dyePowder.shiftedIndex)
			return 5000;
			
		return 0;
	}

	/**********************************************************************
	 * 
	 */
	@Override
	public boolean onEntityLeftClick(EntityPlayer player, Entity entity, ItemStack withItem)
	{
		if(withItem != null && withItem.getItem() == this.scepter && entity instanceof EntityChicken)
		{
			entity.dropItem(Item.egg.shiftedIndex, 1);
			return true;
		}
		
		return false;
	}
	
	/**********************************************************************
	 * 
	 */
	@Override
	public boolean onEntityRightClick(EntityPlayer player, Entity entity, ItemStack withItem)
	{
		if(withItem != null && withItem.getItem() == this.scepter && entity instanceof EntityChicken)
		{
			entity.dropItem(Item.feather.shiftedIndex, 1);
			return true;
		}
		
		return false;
	}

	/**********************************************************************
	 * 
	 */
	@Override
	public boolean onBlockLeftClick(EntityPlayer player, Block block, int x, int y, int z, int side, ItemStack withItem)
	{
		if(withItem != null && withItem.getItem() == this.scepter && (block == Block.sand || block == Block.blockGold))
		{
			api().mc().theWorld.setBlockWithNotify(x, y, z, Block.blockGold.blockID);
			return true;
		}
		
		return false;
	}
	
	/**********************************************************************
	 * 
	 */
	@Override
	public boolean onBlockRightClick(EntityPlayer player, Block block, int x, int y, int z, int side, ItemStack withItem)
	{
		if(withItem != null && withItem.getItem() == this.scepter && (block == Block.sand || block == Block.blockDiamond))
		{
			api().mc().theWorld.setBlockWithNotify(x, y, z, Block.blockDiamond.blockID);
			return true;
		}
		
		return false;
	}

	/**********************************************************************
	 * 
	 */
	@Override
	public Chunk onProvideChunk(World world, int chunkXPos, int chunkZPos, int dimension)
	{
		if(dimension != 0)
			return null;
		
		if(chunkXPos < 4 && chunkXPos > -4 && chunkZPos < 4 && chunkZPos > -4)
		{
	        byte chunkData[] = new byte[32768];
	        Chunk chunk = new Chunk(world, chunkData, chunkXPos, chunkZPos);
	        
	        for(int y = 0; y < 128; ++y)
	        {
		        for(int z = 0; z < 16; ++z)
		        {
			        for(int x = 0; x < 16; ++x)
			        {
			            int pos = x << 11 | z << 7 | y;
			            
			            if(y < 60)
			            	chunkData[pos] = (byte) Block.stone.blockID;
			            else if (y < 63)
			            	chunkData[pos] = (byte) Block.dirt.blockID;
			            else if (y < 64)
			            	chunkData[pos] = (byte) Block.grass.blockID;
			        }
		        }
	        }
	        
			return chunk;
		}
		
		return null;
	}

	/**********************************************************************
	 * 
	 */
	@Override
	public boolean onPopulateChunk(int chunkXPos, int chunkZPos, int dimension)
	{
		if(dimension != 0)
			return false;
		
        int x = chunkXPos * 16;
        int z = chunkZPos * 16;

        Random rand = new Random();
        long worldSeed = api().mc().theWorld.func_22138_q();
        rand.setSeed(worldSeed);
        long rnd1 = rand.nextLong();
        long rnd2 = rand.nextLong();
        rand.setSeed(((long)x * rnd1 + (long)z * rnd2) ^ worldSeed);
        
        for(int count = 0; count < 10; count++)
        {
            int xPos = x + rand.nextInt(16);
            int yPos = 32 + rand.nextInt(32);
            int zPos = z + rand.nextInt(16);
            (new WorldGenMinable(this.silverOre.blockID, 8)).generate(api().mc().theWorld, rand, xPos, yPos, zPos);
        }
        
		return false;
	}

	/**********************************************************************
	 * 
	 */
	@Override
	public void afterPopulateChunk(int chunkXPos, int chunkZPos, int dimension)
	{
	}
	
	/**********************************************************************
	 * 
	 */
	@Override
	public GuiScreen onGuiOpening(GuiScreen gui)
	{
		return null;
	}
}
