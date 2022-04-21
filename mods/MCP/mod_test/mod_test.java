package MCP.mod_test;

import MCP.Mod;
import MCP.ApiController;
import MCP.ApiCraftMgr;

import net.minecraft.src.Block;
import net.minecraft.src.Chunk;
import net.minecraft.src.Entity;
import net.minecraft.src.EntityPlayer;
import net.minecraft.src.GuiScreen;
import net.minecraft.src.ItemStack;
import net.minecraft.src.World;

public class mod_test extends Mod
{
	/**********************************************************************
	 * 
	 */
	public mod_test(ApiController ctrl)
	{
		super(ctrl);
	}
	
	/**********************************************************************
	 * 
	 */
	@Override
	public String getModName()
	{
		return "Test Mod";
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
	public String getModDescription()
	{
		String desc = "A test mod for the MCP Mod";
		desc += "\nSystem tutorials.";
		return desc;
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
	}

	/**********************************************************************
	 * 
	 */
	@Override
	public void onGameEnding()
	{
	}
	
	/**********************************************************************
	 * 
	 */
	@Override
	public void onTick()
	{
	}

	/**********************************************************************
	 * 
	 */
	@Override
	public void onRegisterBlocksAndItems()
	{
	}

	/**********************************************************************
	 * 
	 */
	@Override
	public void onRegisterRecipes(ApiCraftMgr craftMgr)
	{
	}
	
	/**********************************************************************
	 * 
	 */
	@Override
	public boolean onConsoleCommand(String command, String param)
	{
		return false;
	}

	/**********************************************************************
	 * 
	 */
	@Override
	public boolean onKeyPress(int keycode, boolean pressed)
	{
		return false;
	}

	/**********************************************************************
	 * 
	 */
	@Override
	public int onAddFuel(int itemID)
	{
		return 0;
	}

	/**********************************************************************
	 * 
	 */
	@Override
	public boolean onEntityLeftClick(EntityPlayer player, Entity entity, ItemStack withItem)
	{
		return false;
	}
	
	/**********************************************************************
	 * 
	 */
	@Override
	public boolean onEntityRightClick(EntityPlayer player, Entity entity, ItemStack withItem)
	{
		return false;
	}

	/**********************************************************************
	 * 
	 */
	@Override
	public boolean onBlockLeftClick(EntityPlayer player, Block block, int x, int y, int z, int side, ItemStack withItem)
	{
		return false;
	}
	
	/**********************************************************************
	 * 
	 */
	@Override
	public boolean onBlockRightClick(EntityPlayer player, Block block, int x, int y, int z, int side, ItemStack withItem)
	{
		return false;
	}

	/**********************************************************************
	 * 
	 */
	@Override
	public Chunk onProvideChunk(World world, int chunkXPos, int chunkZPos, int dimension)
	{
		return null;
	}

	/**********************************************************************
	 * 
	 */
	@Override
	public boolean onPopulateChunk(int chunkXPos, int chunkZPos, int dimension)
	{
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
